TODO

- Redeem vouchers locks shopping cart
- Click finish shopping -> display voucher box and let's you apply them
- Review public vs private methods (notably loader class)

JS

- Change all link actions to AJAX calls
- render JSON response rather than redirect

CSS/HTML

- Style

Workings

- Could have added full logic to handle applying vouchers and then removing discounts if items are removed that render them invalid
- However out the scope of user stories so decided to simply lock shopping cart once a discount has been applied

Classes:
--------

- DatabaseTable: mock database functionality
- ObjectLoader: creates array of objects from flat file
- Product: basic unit of data of the site
- Shopping cart: holds selected products and calculates total price
- Voucher: produces discounts when applied to a shopping cart
- ClothingEStore: sinatra application





