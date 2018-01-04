class CreateCheckbanks < ActiveRecord::Migration[5.1]
  def change
    create_table :checkbanks do |t|
      t.integer :nomer, null: false
      t.integer :password, null: false
      t.integer :chelid
      t.timestamps
      t.timestamps
    end
  end
end
