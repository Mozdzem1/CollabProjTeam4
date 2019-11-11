class AddDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :users,
      :name,
      'Steve'
      )
  end
end
