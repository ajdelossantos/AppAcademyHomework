class ChangeBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :year, :integer
    add_column :books, :category, :string
    add_column :books, :description, :text
  end
end
