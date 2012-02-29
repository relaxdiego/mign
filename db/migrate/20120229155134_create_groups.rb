class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.boolean :archived
      t.datetime :tasks_updated_at

      t.timestamps
    end
    add_index :groups, :name, :unique => true
    add_index :groups, :archived
  end
end
