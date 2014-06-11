class City < ActiveRecord::Base
  attr_accessible :country_id, :name, :state_id
  has_many :locations
  has_many :areas
  belongs_to :country
  belongs_to :state

  validates :name, presence: true
  #validates :country_id, presence: true
  before_save :set_country
  scope :by_country, ->(country_id) { where(country_id: country_id) }
  scope :by_state, ->(state_id) { where(state_id: state_id) }

  def set_country
    self.country_id = self.state.country_id
  end
end
