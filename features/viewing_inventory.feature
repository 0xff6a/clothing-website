Feature:
  As a User
  I want to be able to see a product inventory
  So that I can decide what to buy

  Scenario: Viewing Inventory
    Given I am on the homepage
    Then I should see a list of products
      And their category, price and availability