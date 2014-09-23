require_relative 'product'

class ProductLoader

  class << self 
    
    def products_from(filename)
      raw_data_from(filename).map{ |data_string| create_product_from(data_string) }
    end

    def parse(product_data_string)
      product_data_string[1..-2].split('%')
    end

    def create(parsed_product_data)
      Product.new(*product_data_to_a(parsed_product_data))
    end

    private

    def create_product_from(data_string)
      create(parse(data_string))
    end

    def product_data_to_a(parsed_product_data)
      [
        parsed_product_data[0].to_i,
        parsed_product_data[1],
        parsed_product_data[2],
        parsed_product_data[3].delete('£').to_f,
        parsed_product_data[4].to_i
      ]
    end

    def raw_data_from(filename)
      File.read(filename).scan(/\(.*\)/)
    end

  end

end