class ChangeScheduleDeliveryIdInItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :schedule__delivery_id, :schedule_delivery_id
  end
end
