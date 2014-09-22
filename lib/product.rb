class Product

  attr_reader :name,
              :category,
              :price,
              :stock

  def initialize( name,
                  category,
                  price,
                  stock 
                )
    @name = name
    @category = category
    @price = price.to_f
    @stock = stock.to_i
  end

end