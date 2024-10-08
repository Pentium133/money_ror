# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  account_type :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  parent_id    :integer
#
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:child_accounts).class_name('Account').with_foreign_key('parent_id') }
  end

  describe 'validations' do
    it 'is valid with a name' do
      account = Account.new(name: 'Наличные')
      expect(account).to be_valid
    end

    it 'is not valid without a name' do
      account = Account.new(name: nil)
      expect(account).to_not be_valid
      expect(account.errors[:name]).to include("can't be blank")
    end
  end

  describe 'enum account_type' do
    it 'defines account types' do
      expect(Account.account_types.keys).to contain_exactly('asset', 'liability', 'income', 'expense')
    end

    it 'can set account_type to asset' do
      account = Account.new(name: 'Cash', account_type: :asset)
      expect(account.asset?).to be true
    end

    it 'can set account_type to liability' do
      account = Account.new(name: 'Credit', account_type: :liability)
      expect(account.liability?).to be true
    end

    it 'can set account_type to income' do
      account = Account.new(name: 'Salary', account_type: :income)
      expect(account.income?).to be true
    end

    it 'can set account_type to expense' do
      account = Account.new(name: 'Food', account_type: :expense)
      expect(account.expense?).to be true
    end
  end
end
