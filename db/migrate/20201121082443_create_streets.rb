class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.string  :postal, null: false
      t.text    :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :apartment
      t.string :phone_number, null: false
      t.references :record, null: false, foreign_key: true
      t.timestamps
    end
  end
end