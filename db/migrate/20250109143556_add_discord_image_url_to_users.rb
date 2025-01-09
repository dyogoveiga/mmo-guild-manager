class AddDiscordImageUrlToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :discord_image_url, :string
  end
end
