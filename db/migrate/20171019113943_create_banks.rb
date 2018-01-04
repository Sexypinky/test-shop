class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.integer :nomer, null: false, default: 0
      t.integer :password, null: false, default: 0
      t.timestamps
    end
  end
end
