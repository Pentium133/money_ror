# == Schema Information
#
# Table name: money_transactions
#
#  id               :integer          not null, primary key
#  description      :string
#  transaction_date :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class MoneyTransaction < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :transaction_date, presence: true
  validates :description, presence: true
  validate :entries_must_balance


  def balanced?
    entries.sum(:amount) == 0
  end

  private

  def entries_must_balance
    if !balanced?
      errors.add(:base, "The transaction is not balanced. Total amount must be zero.")
    end
  end
end
