class ChangeDescriptionToText < ActiveRecord::Migration[5.2]
  def change
    rename_column :subs, :desription, :description
  end
end
