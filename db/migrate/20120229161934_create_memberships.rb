class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :workspace_id
      t.integer :level

      t.timestamps
    end
  end
end
