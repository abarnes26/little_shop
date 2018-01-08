class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates_presence_of :status, :total_price, :created_at, :updated_at
  scope :ordered_by_id, -> {order(:id)}

  def item_count
    items.group(:id).count
  end

  def item_subtotals
    items.group(:id).sum(:price)
  end

  def item_count_and_subtotals
    item_count.merge(item_subtotals) do |item, count, subtotal|
      "Quantity: #{count} || Subtotal: $#{'%.2f' % subtotal}"
    end.transform_keys {|item_id| Item.find(item_id)}
  end

  def total_item_price
    items.sum(:price)
  end

  def self.user_count
    group(:user_id).order("count_all DESC").limit(1).count.keys.first
  end

  def self.group_by_status_count
    group(:status).count
  end

end
