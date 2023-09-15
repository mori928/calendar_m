class CreateYoyakus < ActiveRecord::Migration[7.0]
  def change
    create_table :yoyakus do |t|
      t.string   :content,             null: false
      t.integer  :discus_type_id,      null: false
      t.text     :title
      t.datetime :start_time,          null: false
      t.timestamps 
    end
  end
end
