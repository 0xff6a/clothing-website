Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see a list of products$/) do
  expect(page).to have_content('Product Name')
  expect(page).to have_content('Almond Toe Court Shoes, Patent Black')
end

Then(/^their category, price and availability$/) do
  expect(page).to have_content('Women’s Footwear')
  expect(page).to have_content('£99.00')
  expect(page).to have_content('5')
end