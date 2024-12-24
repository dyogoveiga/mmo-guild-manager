class AddDiscordUsernameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :discord_username, :string

    add_index :users, [ :discord_username ], unique: true
  end
end
