class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :location_type_id
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.integer :area_id
      t.string :description
      t.string :address1
      t.string :address2
      t.string :telephone1
      t.string :telephone2
      t.string :whatsapp
      t.string :bbm
      t.string :hours_operation
      t.string :website
      t.boolean :kit_available_for_purchase, :default => true
      t.boolean :drop_off_location, :default => true
      t.string :gps_code
      t.string :note
      t.string :bank_name
      t.string :bank_account_holder
      t.string :bank_account_number

      t.timestamps
    end
  end
end
