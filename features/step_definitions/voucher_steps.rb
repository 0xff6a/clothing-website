When(/^I apply a valid voucher$/) do
  first('.voucher').click_link('Redeem')
end

Then(/^I can view the discounted total price of my products$/) do
  expect(_shopping_cart).to have_content('£490.00')
end

Then(/^I can see how much I have saved$/) do
  expect(_shopping_cart).to have_content('You saved £5')
end

When(/^I apply a invalid voucher$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I will receive an alert that my voucher is invalid$/) do
  pending # express the regexp above with the code you wish you had
end
