require_relative 'product'

class ProductLoader

  def self.create(parsed_product_data)
    Product.new(*product_data_to_a(parsed_product_data))
  end

  def self.parse(product_data_string)
    product_data_string[1..-2].split('%')
  end

  private

  def self.product_data_to_a(parsed_product_data)
    [
      parsed_product_data[0],
      parsed_product_data[1],
      parsed_product_data[2].delete('£').to_f,
      parsed_product_data[3].to_i
    ]
  end


end