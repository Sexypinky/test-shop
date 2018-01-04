class DropClientsTable < ActiveRecord::Migration[5.1]
  def change
    def up
      drop_table :clients
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
