require 'rails_helper'

describe "When an authenticated user visits the /orders path" do
  describe "and clicks on a link for a specific order" do
    before(:each) do
      @user = create(:user)
      @order = create(:order, user: @user)
      @item1, @item2, @item3 = create_list(:item, 3)
      @order.items << [@item1,@item2,@item3,@item1]

      visit root_path
      click_on "Login"
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      click_on "Submit"

      visit orders_path
      click_on "#{@order.id}"
    end

    it "should see each item for that order with quantity and subtotal" do
      expect(page).to have_content "Price: 100.0 || Quantity: 2 || Subtotal: $200.00"
      expect(page).to have_content "Price: 100.0 || Quantity: 1 || Subtotal: $100.00"
      expect(page).to have_content "Price: 100.0 || Quantity: 1 || Subtotal: $100.00"
    end

    it "should also see links for each item's show page" do
      expect(find_link("#{@item1.name}").visible?).to eq true
      expect(find_link("#{@item2.name}").visible?).to eq true
      expect(find_link("#{@item3.name}").visible?).to eq true
    end

    it "should see the order status, order total price, and date order was submitted" do
      expect(page).to have_content @order.status
      expect(page).to have_content @order.created_at.strftime("%b %d, %Y")
      expect(page).to have_content @order.total_item_price
    end
  end
end
