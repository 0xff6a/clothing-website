Given(/^I have chosen a product to buy$/) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |link_name|
  first('.product').click_link(link_name)
end

Then(/^it will be added to the shopping cart$/) do
    expect(_shopping_cart).to have_content('Almond Toe Court Shoes, Patent Black')
    expect(_shopping_cart).to have_content('x1')
    expect(_shopping_cart).to have_content('@ £99.00')
end

Given(/^I have added a product by mistake$/) do
  visit '/'
end

When(/^I click the remove link$/) do
 click_link '-'
end

Then(/^it will be removed from the shopping cart$/) do
  expect(_shopping_cart).not_to have_content('Almond Toe Court Shoes, Patent Black')
end

Given(/^I have added products to my cart$/) do
  visit '/'
  2.times { first('.product').click_link('Add to cart') }
end

Then(/^I can view the total price for products in my cart$/) do
  expect(_shopping_cart).to have_content '£198.00'
end

Given(/^a product is out of stock$/) do
  visit '/'
  3.times { first('.product').click_link('Add to cart') }
end

When(/^I try to add it to my cart$/) do
  first('.product').click_link('Add to cart')
end

Then(/^I receive an error message$/) do
  expect(page).to have_content('The selected product is out of stock')
end

Then(/^the product is not added to the cart$/) do
  expect(_shopping_cart).to have_content('x5')
end

def _shopping_cart
  page.find('.cart')
end