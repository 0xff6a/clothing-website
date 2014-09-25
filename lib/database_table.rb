class DatabaseTable

  attr_accessor :rows

  def initialize(data)
    @rows = data
  end

  def find(id)
    where(:id, id.to_i).first
  end

  def where(attribute, value)
    rows.select{ |product| product.send(attribute) == value }
  end

  alias_method :all, :rows

end