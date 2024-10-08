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
class Account < ApplicationRecord
  has_many :child_accounts, class_name: "Account", foreign_key: "parent_id"

  validates :name, presence: true
end
