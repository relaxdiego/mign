class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.string :name
      t.text :description
      t.boolean :archived
      t.datetime :tasks_updated_at

      t.timestamps
    end
    add_index :workspaces, :name, :unique => true
    add_index :workspaces, :archived
  end
end
