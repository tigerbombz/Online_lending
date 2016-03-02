class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :reason
      t.text :description
      t.float :amount

      t.timestamps null: false
    end
  end
end
