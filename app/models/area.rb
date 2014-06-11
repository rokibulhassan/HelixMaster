class Area < ActiveRecord::Base
  attr_accessible :name, :city_id
  belongs_to :city
  has_many :locations

  validates :name, presence: true
  validates :city_id, presence: true

  scope :by_city, ->(city_id) { where(city_id: city_id) }
end
