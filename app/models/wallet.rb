class Wallet < ApplicationRecord
  belongs_to :character

  def balance
    super || 0
  end
end
