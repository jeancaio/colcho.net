class AddPictureToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :picture, :string
  end
end
