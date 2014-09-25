class ShoppingCart

  attr_reader   :products
  attr_accessor :discount

  def initialize
    @products = []
    @discount = 0
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

  def has_footwear_item?
    products.map(&:category).any?{ |cat| cat.downcase =~ /footwear/}
  end

  def product_ids
    products.map(&:id)
  end

  def product_by(id)
    products.select{ |product| product.id == id }.first
  end

  def total
    raw_total - discount
  end 

  def raw_total
    products.map(&:stock_value).inject(0, :+)
  end

  def formatted_total
    '£' + sprintf('%.2f', total)
  end

  def formatted_discount
    '£' + sprintf('%.2f', discount)
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
    @products.delete(product_by(product.id))
  end

  def add_new(product)
    @products << product
  end

  def missing_product_error
    raise 'Error:product is not in the cart'
  end

end