class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.string :name
      t.text :description
      t.boolean :archived

      t.timestamps
    end
    add_index :workspaces, :name, :unique => true
    add_index :workspaces, :archived
  end
end
