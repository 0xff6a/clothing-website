Feature: 
  As a user
  I want to be able to add/remove products to my shopping cart
  So that I can place an order

  @javascript
  Scenario: Adding to the cart
    Given I have chosen a product to buy
    When I click "Add to cart"
    Then it will be added to the shopping cart

  @javascript
  Scenario: Removing from the cart
    Given I have added a product by mistake
    When I click the remove link
    Then it will be removed from the shopping cart

  @javascript
  Scenario: Total price of purchases
    Given I have added products to my cart
    Then I can view the total price for products in my cart  

  @javascript
  Scenario: Out of stock product
    Given a product is out of stock
    When I try to add it to my cart
    Then I receive an error message
      And the product is not added to the cart