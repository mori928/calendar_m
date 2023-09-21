class AddDeletedAtToYoyakus < ActiveRecord::Migration[7.0]
  def change
    add_column :yoyakus, :deleted_at, :datetime
    add_index :yoyakus, :deleted_at
  end
end
