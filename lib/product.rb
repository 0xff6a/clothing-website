class Product

  attr_reader :name,
              :category,
              :price,
              :stock

  def initialize(name, category, price, stock)
    @name = name
    @category = category
    @price = price
    @stock = stock
  end

  def in_stock?
    stock > 0
  end

  def formatted_price
    '£' + sprintf('%.2f', price)
  end

end