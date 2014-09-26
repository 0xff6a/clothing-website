require_relative 'formatter'

class Voucher

  include Formatter

  attr_reader :id, :discount, :description, :conditions

  def initialize(id, discount, description, *conditions)
    @id = id
    @discount = discount
    @description = description
    @conditions = conditions.flatten(1)
  end

  def valid_for?(shopping_cart)
    conditions.all?{ |condition| eval('shopping_cart.' + condition)}
  end

  def apply_to(shopping_cart)
    return apply_discount(shopping_cart) if valid_for?(shopping_cart)
    :fail
  end

  def formatted_discount
    format_ccy(discount)
  end

  private

  def apply_discount(shopping_cart)
    shopping_cart.discount += discount
  end

end