require_relative 'formatter'

class Product

  include Formatter

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
    format_ccy(price)
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

  protected

  def set_stock(value)
    @stock = value
    self
  end

end