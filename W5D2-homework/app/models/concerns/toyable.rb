module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    #IDEA not an array => call the method directly on self.toys
    # toy = Toy.find_or_create_by(name: name)
    #
    # self.toys += toy
    self.toys.find_or_create_by(name: name)
  end
end
