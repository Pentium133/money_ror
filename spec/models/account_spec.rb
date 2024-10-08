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
end
