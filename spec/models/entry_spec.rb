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
  pending "add some examples to (or delete) #{__FILE__}"
end
