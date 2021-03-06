class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string       :postal_code,      null: false
      t.integer      :delivery_from_id, null: false
      t.string       :city,             null: false
      t.string       :house_number,     null: false
      t.string       :building_name,    null: false
      t.string       :telephone_no,     null: false
      t.references   :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
