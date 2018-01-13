class Category < ApplicationRecord
  before_save :generate_slug
  validates :name, presence: true
  has_many :items
  has_many :order_items, through: :items
  has_many :orders, through: :order_items

  def highest_priced_item
    max_price = items.maximum(:price)
    items.find_by(price: max_price)
  end

  def number_of_orders_for_category
    orders.distinct.count
#This also works (without needing the extra has_many relationship all the way to orders)
    order_items.select(:order_id).distinct.count
  end

  private

    def generate_slug
      self.slug = name.parameterize
    end

end
