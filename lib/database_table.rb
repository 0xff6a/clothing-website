class DatabaseTable

  attr_accessor :rows

  def initialize(data)
    @rows = data
  end

  def find_by(attribute, value)
    rows.select{ |product| product.send(attribute) == value }.first
  end

end