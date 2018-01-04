class AddAdminToChel < ActiveRecord::Migration[5.1]
  def change
    add_column :chels, :admin, :boolean, default: false
  end
end
