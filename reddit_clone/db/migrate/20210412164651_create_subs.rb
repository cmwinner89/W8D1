class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :desription, null: false
      t.integer :moderator_id, null: false
      t.index :moderator_id
      t.timestamps
    end
  end
end
