class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :description
      t.boolean :complete, default: false
      t.boolean :in_progress, default: false
      t.boolean :like
      t.belongs_to :list

      t.timestamps
    end
  end
end
