class ChangeTran < ActiveRecord::Migration[5.1]
  def change
    change_table :transactions do |t|
      t.integer :nomerto
      t.integer :nomerfrom
    end
  end
end
