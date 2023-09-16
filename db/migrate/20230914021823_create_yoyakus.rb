class CreateYoyakus < ActiveRecord::Migration[7.0]
  def change
    create_table :yoyakus do |t|
      t.string     :title,               null: false
      t.text       :content,             null: false
      t.datetime   :start_time,          null: false
      t.timestamps 
    end
  end
end
