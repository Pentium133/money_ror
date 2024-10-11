# == Schema Information
#
# Table name: entries
#
#  id                   :integer          not null, primary key
#  amount               :decimal(10, 2)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  account_id           :integer          not null
#  money_transaction_id :integer          not null
#
# Indexes
#
#  index_entries_on_account_id            (account_id)
#  index_entries_on_money_transaction_id  (money_transaction_id)
#
# Foreign Keys
#
#  account_id            (account_id => accounts.id)
#  money_transaction_id  (money_transaction_id => money_transactions.id)
#
require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'associations' do
    it { should belong_to(:money_transaction) }
    it { should belong_to(:account) }
  end

  describe 'validations' do
    let(:transaction) { MoneyTransaction.create!(transaction_date: Date.today, description: 'Test transaction') }
    let(:account) { Account.create!(name: 'Test account', account_type: 'asset') }

    it 'is valid with an amount and account_id' do
      entry = Entry.new(amount: 50.0, account_id: account.id, money_transaction: transaction)
      expect(entry).to be_valid
    end

    it 'is not valid without an amount' do
      entry = Entry.new(amount: nil, account_id: account.id, money_transaction: transaction)
      expect(entry).to_not be_valid
      expect(entry.errors[:amount]).to include("can't be blank")
    end

    it 'is not valid without an account_id' do
      entry = Entry.new(amount: 50.0, account_id: nil, money_transaction: transaction)
      expect(entry).to_not be_valid
      expect(entry.errors[:account]).to include("must exist")
    end
  end
end
