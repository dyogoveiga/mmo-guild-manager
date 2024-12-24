class CreateWalletTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :wallet_transactions do |t|
      t.integer :amount
      t.references :wallet, null: false, foreign_key: true
      t.string :type
      t.integer :resource_origin_id
      t.string :resource_origin_type
      t.string :reason

      t.timestamps
    end
  end
end
