class CreateGoBucksWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :go_bucks_wallets do |t|
      t.bigint :balance, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_check_constraint :go_bucks_wallets, "balance >= 0", name: "balance_check"
  end
end
