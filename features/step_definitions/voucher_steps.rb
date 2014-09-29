Given(/^I have checked out$/) do
  visit '/'
  click_link "Checkout"
end

Given(/^I have not yet checkout out$/) do
  visit '/'
end

Then(/^I should not see what vouchers are available$/) do
  expect(page).not_to have_css('.vouchers')
end

When(/^I apply a valid voucher$/) do
  first('.voucher').click_link('Redeem')
end

When(/^I checkout$/) do
  visit '/'
  click_link "Checkout"
end

Then(/^I can see what vouchers are available$/) do
  expect(page).to have_css('.vouchers')
end

Then(/^I can view the discounted total price of my products$/) do
  expect(_shopping_cart).to have_content('£490.00')
end

Then(/^I can see how much I have saved$/) do
  expect(_shopping_cart).to have_content('You saved £5')
end

Given(/^I have purchased a product$/) do
  visit '/'
  5.times { click_link '-' }
  page.all('.product')[1].click_link('Add to cart')
end

When(/^I apply a invalid voucher$/) do
  page.all('.voucher')[2].click_link('Redeem')
end

Then(/^I will receive an alert that my voucher is invalid$/) do
  expect(page).to have_content('The selected voucher is not valid')
end
