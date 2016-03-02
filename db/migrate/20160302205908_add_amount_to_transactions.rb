class AddAmountToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :amount, :int
  end
end
