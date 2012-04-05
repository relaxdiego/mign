class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :subject
      t.text    :body
      t.integer :ticket_id
      t.integer :author_id

      t.timestamps
    end
    add_index :comments, :ticket_id
    add_index :comments, :author_id
  end
end
