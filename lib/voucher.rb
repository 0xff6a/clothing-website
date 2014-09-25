class Voucher

  attr_reader :id, :discount, :description, :conditions

  def initialize(id, discount, description, *conditions)
    @id = id
    @discount = discount
    @description = description
    @conditions = conditions
  end

  def valid_for?(shopping_cart)
    conditions.all?{ |condition| eval('shopping_cart.' + condition)}
  end

  def apply_to(shopping_cart)
    apply_discount(shopping_cart) if valid_for?(shopping_cart)
  end

  def formatted_discount
    '£' + sprintf('%.2f', discount)
  end

  private

  def apply_discount(shopping_cart)
    shopping_cart.discount += discount
  end

end