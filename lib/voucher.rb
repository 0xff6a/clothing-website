class Voucher

  attr_reader :discount, :conditions

  def initialize(discount, *conditions)
    @discount = discount
    @conditions = conditions
  end

  def valid_for(shopping_cart)
    conditions.all?{ |condition| eval('shopping_cart.' + condition)}
  end

end