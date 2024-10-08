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
FactoryBot.define do
  factory :account do
    name { "MyString" }
    account_type { 1 }
    parent_id { 1 }
  end
end
