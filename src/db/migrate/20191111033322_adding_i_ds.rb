class AddingIDs < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :fav_org, :string, array: true, default: []
     add_column :users, :signed_up, :string, array: true, default: []
     add_column :opportunities, :user_id, :string, array: true, default: []
  end
end
