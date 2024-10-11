class CreateMoneyTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :money_transactions do |t|
      t.date :transaction_date
      t.string :description

      t.timestamps
    end
  end
end
