class ChangeB < ActiveRecord::Migration[5.1]
  def change
    change_table :banks do |t|
      t.remove :nomer
      t.remove :password
      t.integer :nomer
      t.integer :password
    end
  end
end
