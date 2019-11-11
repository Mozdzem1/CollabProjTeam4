class AddFav < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav_event, :string, array: true, default: []
  end
end
