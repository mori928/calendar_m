class CreateYoyakus < ActiveRecord::Migration[7.0]
  def change
    create_table :yoyakus do |t|
      t.string :title
      t.text :content
      t.datetime :start_time
      t.timestamps
    end
  end
end
