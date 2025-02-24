class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.index :id, unique: true

      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
