class Wallet < ApplicationRecord
  belongs_to :character
  has_many :wallet_transactions, dependent: :destroy

  def balance
    super || 0
  end
end
