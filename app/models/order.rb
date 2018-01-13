class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates_presence_of :status, :total_price
  scope :ordered_by_id, -> {order(:id)}
  scope :find_where_completed, -> {where(status: "Completed")}

  def item_count
    items.group(:id).count
  end

  def item_subtotals
    items.group(:id).sum(:price)
  end

  def total_item_price
    order_items.sum(:sub_total)
  end

  def total_item_count
    order_items.sum(:quantity)
  end

  def self.user_count
    group(:user_id).order("count_all DESC").limit(1).count.keys.first
  end

  def self.group_by_status_count
    group(:status).count
  end

  def self.states_with_count_of_orders
    find_where_completed.joins(:user).group(:state).count
  end

  def self.states_with_count_of_orders_sorted_by_count
    find_where_completed.joins(:user).group(:state).order("count_all DESC").count
  end

end
