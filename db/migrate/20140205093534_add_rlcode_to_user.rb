class AddRlcodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :rlcode, :string
  end
end
