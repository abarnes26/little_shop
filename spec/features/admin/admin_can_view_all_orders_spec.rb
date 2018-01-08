require 'rails_helper'

describe "An admin is logged in" do
  describe "Admin views a show page for one order" do
    it "Admin can see all order details" do
      @user = create(:user, role: 1)
      @order = create(:order, user: @user)
      @item1, @item2, @item3 = create_list(:item, 3)
      @order.items << [@item1,@item2,@item3,@item1]
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit admin_order_path(@order)

      expect(page).to have_content(@order.status)
      expect(page).to have_content(@order.total_item_price)
      expect(page).to have_content(@order.created_at.strftime("%b %d, %Y"))
      expect(page).to have_content(@order.updated_at.strftime("%b %d, %Y"))
      expect(page).to have_content(@order.user.full_name)
      expect(page).to have_content(@order.user.address)
      expect(page).to have_content "Price: 100.0 || Quantity: 2 || Subtotal: $200.00"
      expect(page).to have_content "Price: 100.0 || Quantity: 1 || Subtotal: $100.00"
      expect(page).to have_content "Price: 100.0 || Quantity: 1 || Subtotal: $100.00"
    end
  end
end
