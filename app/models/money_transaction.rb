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

  def balanced?
    entries.sum(:amount) == 0
  end
end
