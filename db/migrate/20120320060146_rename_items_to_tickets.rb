class RenameItemsToTickets < ActiveRecord::Migration
  def up
    rename_table :items, :tickets
  end

  def down
    rename_table :tickets, :items
  end
end
