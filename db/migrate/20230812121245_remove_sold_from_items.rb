class RemoveSoldFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :sold, :boolean, null: false
  end
end
