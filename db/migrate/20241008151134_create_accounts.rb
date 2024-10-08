class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :account_type
      t.integer :parent_id

      t.timestamps
    end
  end
end
