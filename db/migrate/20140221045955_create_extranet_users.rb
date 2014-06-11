class CreateExtranetUsers < ActiveRecord::Migration
  def change
    create_table :extranet_users do |t|
      t.string :viewable_code
      t.string :password
      t.string :rl_code

      t.timestamps
    end
  end
end
