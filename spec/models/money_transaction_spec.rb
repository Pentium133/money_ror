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
  pending "add some examples to (or delete) #{__FILE__}"
end
