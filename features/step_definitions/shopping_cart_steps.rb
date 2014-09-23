Given(/^I have chosen a product to buy$/) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |link_name|
  first('.product').click_link(link_name)
end

Then(/^it will be added to the shopping cart$/) do
    expect(page.find('.cart')).to have_content('Almond Toe Court Shoes, Patent Black')
    expect(page.find('.cart')).to have_content('x1')
    expect(page.find('.cart')).to have_content('@ £99.00')
end

Given(/^I have added a product by mistake$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^it will be removed from the shopping cart$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have added products to my cart$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can view the total price for products in my cart$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a product is out of stock$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I try to add it to my cart$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I receive an error message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the product is not added to the cart$/) do
  pending # express the regexp above with the code you wish you had
end