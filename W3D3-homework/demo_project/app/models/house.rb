class House < ApplicationRecord
  has_many :people,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'

    # getter/setter method aliased :people
end
