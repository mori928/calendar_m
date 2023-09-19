class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer       :personal_id,  null: false
      t.string        :email,        null: false, default: ""
      t.text          :comment
      t.references    :yoyaku_id,    null: false
      t.timestamps
    end
  end
end





