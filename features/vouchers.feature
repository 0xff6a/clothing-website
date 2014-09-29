Feature:
  As a price-conscious user
  I want to be able to redeem a voucher
  So that I can get a discount

  @javascript
  Scenario: Before checking out
    Given I have added products to my cart
      And I have not yet checkout out
    Then I should not see what vouchers are available

  @javascript
  Scenario: Checking out
    Given I have added products to my cart
    When I click "Checkout"
    Then I can see what vouchers are available

  @javascript
  Scenario: Valid voucher
    Given I have checked out
    When I apply a valid voucher
    Then I can view the discounted total price of my products
      And I can see how much I have saved

  @javascript
  Scenario: Invalid voucher
    Given I have checked out
    When I apply a invalid voucher
    Then I will receive an alert that my voucher is invalid

