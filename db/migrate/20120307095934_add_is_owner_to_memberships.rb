class AddIsOwnerToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :is_owner, :boolean
  end
end
