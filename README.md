Clothing Website
================
[![Code Climate](https://codeclimate.com/github/foxjerem/clothing-website/badges/gpa.svg)](https://codeclimate.com/github/foxjerem/clothing-website) [![Test Coverage](https://codeclimate.com/github/foxjerem/clothing-website/badges/coverage.svg)](https://codeclimate.com/github/foxjerem/clothing-website)

Technical test building a simple online shopping website for a clothing retailer

Ruby Version
------------
Ruby 2.1.2

Features
--------

(See feature tests for full description)

Workings
--------
- Did not add any handling for discounted products (e.g green short sleeve shirt) as was out of scope of user stories
- Could have added full logic to handle applying vouchers and then removing discounts if items are removed that render them invalid. However this was out of the scope of user stories so decided to simply lock shopping cart once the user clicks checkout and apply vouchers subsequently
- Vouchers are applied using an AJAX request. To maintain consistency the cart discounts are reset to zero if the page is reloaded
- Given more time would have handled adding/removing products from carts using AJAX requests also

Classes:
--------
- DatabaseTable: mock database functionality
- ObjectLoader: creates array of objects from flat file
- Product: basic unit of data of the site
- Shopping cart: holds selected products and calculates total price
- Voucher: produces discounts when applied to a shopping cart
- ClothingEStore: sinatra application

Running the application:
------------------------
To open the application on http://localhost:9292/

```shell
$ bundle
$ rackup
```

Running the test suite:
-----------------------
**Feature Tests**
```shell
$ bundle
$ cucumber
```

**Unit Tests**
```shell
$ bundle
$ rspec
```





