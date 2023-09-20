class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.integer       :parson_no,  null: false
      t.string        :email,      null: false, default: ""
      t.text          :comment
      t.references    :yoyaku,     null: false, foreign_key: true  
      t.timestamps
    end
  end
end
