class AddFilePathToRlcode < ActiveRecord::Migration
  def change
    add_column :rlcodes, :file_path, :string
  end
end
