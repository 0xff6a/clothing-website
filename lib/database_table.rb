class DatabaseTable

  attr_accessor :rows
  alias_method  :all, :rows

  def initialize(data)
    @rows = data
  end

  def find(id)
    where(:id, id.to_i).first
  end

  private

  def where(attribute, value)
    rows.select{ |product| product.send(attribute) == value }
  end

end