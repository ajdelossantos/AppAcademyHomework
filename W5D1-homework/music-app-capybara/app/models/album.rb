# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  belongs_to :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id

    has_many :tracks,
      class_name: 'Track',
      foreign_key: :album_id,
      primary_key: :id

end
