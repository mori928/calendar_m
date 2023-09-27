class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :yoyaku_id,   null: false 
      t.integer :guest_id,    null: false 
      t.integer :parson_no, null: false   
      t.timestamps
    end
  end
end
