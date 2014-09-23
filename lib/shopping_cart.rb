class ShoppingCart

  attr_reader :products

  def initialize
    @products = []
  end

  def add(product)
    contains?(product) ? add_to_stock(product) : add_new(product)
  end

  def remove(product)
    missing_product_error unless contains?(product)
    remove_from_stock(product)
  end

  def contains?(product)
    product_ids.include?(product.id)
  end

  def product_ids
    products.map(&:id)
  end

  def product_by(id)
    products.select{ |product| product.id == id }.first
  end

  def total
    products.map(&:stock_value).inject(:+)
  end 

  private

  def add_to_stock(product)
    product_by(product.id).stock += product.stock
  end

  def remove_from_stock(product)
    product_by(product.id).stock -= product.stock
    delete(product) if all_removed?(product)
  end

  def all_removed?(product)
    product_by(product.id).stock <= 0
  end

  def delete(product)
    @products.delete(product)
  end

  def add_new(product)
    @products << product
  end

  def missing_product_error
    raise 'Error:product is not in the cart'
  end

end