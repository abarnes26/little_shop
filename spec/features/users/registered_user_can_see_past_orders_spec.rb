require 'rails_helper'

describe "When a registered user visits the orders path" do
  it "sees all of the orders belonging to him/her in a table" do
    user = create(:user)
    order1 = create(:order, user: user)
    order2 = create(:order, status: "pending", user: user)
    item1, item2, item3 = create_list(:item, 3)
    item4 = create(:item)
    order1.items << [item1,item2,item3]
    order2.items << [item3,item4]

    visit root_path
    click_on "Login"
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Submit"

    expect(current_path).to eq dashboard_path

    click_on "My Orders"

    expect(current_path).to eq orders_path
    expect(page).to have_content order1.status
    expect(page).to have_content order2.status
    expect(page).to have_content order1.total_price
    expect(page).to have_content order2.total_price
    expect(page).to have_content order1.address
    expect(page).to have_content order2.address
  end
end
