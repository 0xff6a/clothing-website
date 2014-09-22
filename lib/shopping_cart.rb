class ShoppingCart

  attr_reader :products

  def initialize
    @products = []
  end

  def add(product)
    @products << product
  end

  def remove(product)
    missing_product_error unless contains?(product)
    @products.delete(product)
  end

  def contains?(product)
    @products.include?(product)
  end

  def total
    products.map(&:stock_value).inject(:+)
  end 

  private

  def missing_product_error
    raise 'Error:product is not in the cart'
  end

end