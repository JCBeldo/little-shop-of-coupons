class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :unique_code, unique: true
      t.integer :status, default: 0
      t.integer :disc_type
      t.decimal :disc_amount
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
