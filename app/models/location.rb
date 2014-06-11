class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :area_id, :bank_account_holder, :bank_account_number, :bank_name, :bbm, :city_id,
                  :country_id, :description, :drop_off_location, :gps_code, :hours_operation, :kit_available_for_purchase,
                  :location_type_id, :name, :note, :state_id, :telephone1, :telephone2, :website, :whatsapp

  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :area
  belongs_to :location_type

  validates :name, presence: true
  validates :country_id, presence: true
  validates :city_id, presence: true
  validates :location_type_id, presence: true

  scope :by_country, ->(country_id) { where(country_id: country_id) }
  scope :by_state, ->(state_id) { where(state_id: state_id) }
  scope :by_city, ->(city_id) { where(city_id: city_id) }
  scope :by_area, ->(area_id) { where(area_id: area_id) }
  scope :search, ->(country_id, state_id, city_id, area_id) { where('country_id=? and state_id=? and city_id=? and area_id=?', country_id, state_id, city_id, area_id) }

  def telephone
    [self.telephone1, self.telephone2].join(",")
  end

  def address
    [self.address1, self.address2].join(",")
  end
end
