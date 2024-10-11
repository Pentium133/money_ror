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
    it 'is valid with a transaction_date and description' do
      transaction = MoneyTransaction.new(transaction_date: Date.today, description: 'Test transaction')
      expect(transaction).to be_valid
    end

    it 'is not valid without a transaction_date' do
      transaction = MoneyTransaction.new(transaction_date: nil)
      expect(transaction).to_not be_valid
      expect(transaction.errors[:transaction_date]).to include("can't be blank")
    end

    it 'is not valid without a description' do
      transaction = MoneyTransaction.new(description: nil)
      expect(transaction).to_not be_valid
      expect(transaction.errors[:description]).to include("can't be blank")
    end
  end
end
