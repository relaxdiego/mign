class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :subject
      t.integer :points
      t.string :description

      t.timestamps
    end
  end
end
