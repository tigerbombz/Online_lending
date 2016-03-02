class AddRaisedToBorrowers < ActiveRecord::Migration
  def change
    add_column :borrowers, :raised, :int
  end
end
