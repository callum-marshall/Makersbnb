class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :listing_id, null: false
      t.date :check_in_date, null: false
      t.date :check_out_date, null: false
      t.string :booker_id, null: false
      t.boolean :confirmed
    end
  end
end
