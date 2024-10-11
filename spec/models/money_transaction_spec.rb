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
require 'rails_helper'

RSpec.describe MoneyTransaction, type: :model do
  describe 'associations' do
    it { should have_many(:entries).dependent(:destroy) }
  end

  describe 'validations' do
    let(:transaction) { MoneyTransaction.create!(transaction_date: Date.today, description: 'Test transaction') }

    it 'is valid with a transaction_date and description' do
      expect(transaction).to be_valid
    end

    it 'is not valid without a transaction_date' do
      transaction.transaction_date = nil
      expect(transaction).to_not be_valid
      expect(transaction.errors[:transaction_date]).to include("can't be blank")
    end

    it 'is not valid without a description' do
      transaction.description = nil
      expect(transaction).to_not be_valid
      expect(transaction.errors[:description]).to include("can't be blank")
    end

    it 'is not valid if the transaction is not balanced' do
      account = Account.create!(name: 'Test account', account_type: 'asset')

      transaction.entries.create!(amount: -50.0, account_id: account.id)
      transaction.entries.build(amount: 30.0, account_id: account.id)

      expect(transaction).to_not be_valid
      expect(transaction.errors[:base]).to include('The transaction is not balanced. Total amount must be zero.')
    end
  end
end
