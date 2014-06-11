class CreateRlcodes < ActiveRecord::Migration
  def change
    create_table :rlcodes do |t|
      t.string :code
      t.text :summary

      t.timestamps
    end
  end
end
