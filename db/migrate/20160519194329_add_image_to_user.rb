class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, default: "spotify.jpeg"
    change_column :users, :provider, :string, default: "spotify"
  end
end
