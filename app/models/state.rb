class State < ActiveRecord::Base
  attr_accessible :country_id, :name

  has_many :cities
  has_many :locations
  belongs_to :country

  validates :name, presence: true
  validates :country_id, presence: true

  scope :by_country, ->(country_id) { where(country_id: country_id) }
end
