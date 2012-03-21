class AddWorkspaceIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :workspace_id, :integer
    add_index :tickets, :workspace_id

  end
end
