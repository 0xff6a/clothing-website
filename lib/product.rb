class Product

  attr_reader   :id, :name, :category, :price
  attr_accessor :stock

  def initialize(id, name, category, price, stock)
    @id = id
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

  def stock_value
    price * stock
  end

  def pop_single
    set_stock(stock - 1).clone.set_stock(1)
  end

  def push_single
    set_stock(stock + 1).clone.set_stock(1)
  end

  def set_stock(value)
    @stock = value
    self
  end

end