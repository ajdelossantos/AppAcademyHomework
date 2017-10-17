require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")

    # TODO What does this do here?
    data.map { |datum| Play.new(datum) }

  end

  def self.find_by_title(title)
    plays = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?;
      SQL

      #TODO solutions include a nil clause; necessary?
      plays.map { |play| Play.new(play) }
  end

  #TODO This method is a mess, see solutions
  def self.find_by_playwright(name)
    plays = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        plays
      JOIN playwrights ON play.playwright_id = playwrights.id
      WHERE
        playwrights.name = ?;
      SQL
    plays.to_a
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    persons = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    #TODO nil escape clause?
    persons.map { |person| Playwright.new(person) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  #TODO This is also a friggin mess
  def get_plays
    plays = PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      SELECT
        *
      FROM
        playwrights
      JOIN
        plays ON playwright.id = plays.playwright_id
      WHERE
        playwright_id = ?;
    SQL
    plays.map { |play| Play.new(play) }
  end
end
