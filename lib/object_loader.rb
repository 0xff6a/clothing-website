require_relative 'product'
require_relative 'voucher'

class ObjectLoader

  class << self 
    
    def products_from(filename)
      create_objects_from(filename, :product)                             
    end

    def vouchers_from(filename)
      create_objects_from(filename, :voucher)
    end

    private

    def create_objects_from(filename, object_type)
      raw_data_from(filename).map{ |data_string| factory(object_type, parse(data_string)) }
    end

    def raw_data_from(filename)
      File.read(filename).scan(/\(.*\)/)
    end

    def parse(data_string)
      data_string[1..-2].split('%')
    end

    def factory(object_type, parsed_data)
      case object_type

      when :product
        Product.new(*product_data_to_args(parsed_data))
      when :voucher
        Voucher.new(*voucher_data_to_args(parsed_data))
      end
    end

    def product_data_to_args(data)
      [
        data[0].to_i,
        data[1],
        data[2],
        data[3].delete('£').to_f,
        data[4].to_i
      ]
    end

    def voucher_data_to_args(data)
      [
        data[0].to_i,
        data[1].to_f,
        data[2],
        data[3].to_s.split(',')
      ]
    end

  end

end