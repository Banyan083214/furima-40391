class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :category_id, null: false
      t.integer :area_id, null: false
      t.integer :condition_id, null: false
      t.integer :price, null: false
      t.integer :load_id, null: false
      t.integer :deadline_id, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end