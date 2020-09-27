class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      # products(商品)テーブルに必要なカラムを追加
      t.integer :user_id, null:false, foreign_key:true
      t.string :name, null:false
      t.text   :explanation, null:false
      t.integer :category_id, null:false
      t.integer :condition_id, null:false
      t.integer :shipping_charge_id, null:false
      t.integer :shipping_area_id, null:false
      t.integer :shipping_day_id, null:false
      t.integer :price, null:false
      
      t.timestamps
    end
  end
end
