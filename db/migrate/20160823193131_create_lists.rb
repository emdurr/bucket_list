class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :activity_type
      t.boolean :complete, default: false
      t.boolean :in_progress, default: false

      t.timestamps
    end
  end
end
