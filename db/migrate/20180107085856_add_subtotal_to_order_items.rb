class AddSubtotalToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :sub_total, :float
  end
end
