class ProfileDefaults < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string, default: "2000 Pennington Road"
  end
end
