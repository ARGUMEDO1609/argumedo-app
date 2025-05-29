class CreateAdminProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_products, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
