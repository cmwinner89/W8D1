class AddIndexToPostSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :post_subs, :post_id, :integer, null: false
    add_index :post_subs, [:post_id, :sub_id], unique: true
  end
end
