class CreateGoBucksTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :go_bucks_transactions do |t|
      t.with_options foreign_key: { to_table: :go_bucks_wallets } do |t|
        t.references :from_wallet
        t.references :to_wallet, null: false
      end

      t.bigint :amount, null: false
      t.string :type, index: true
      t.string :description

      t.timestamps
    end
  end
end
