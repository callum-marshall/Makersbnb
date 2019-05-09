class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :owner_id, null: false
      t.text :description, null: false
      t.string :name, null: false
      t.decimal :price
    end
  end
end
