module Formatter

  def format_ccy(number)
    '£' + sprintf('%.2f', number)
  end

end