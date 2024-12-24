class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.integer :balance
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
