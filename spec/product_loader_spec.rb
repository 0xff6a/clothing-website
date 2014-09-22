require 'product_loader'

describe ProductLoader do
  
  let(:data_string) { '(Mid Twist Cut-Out Dress, Pink%Women’s Formalwear%£540.00%5)' }

  it 'can parse a product data string' do
    expect(ProductLoader.parse(data_string)).to eq( [ 'Mid Twist Cut-Out Dress, Pink',
                                                      'Women’s Formalwear',
                                                      '£540.00',
                                                      '5' ] )
  end

  it 'can create a product from a parsed data string' do
    product = ProductLoader.create(ProductLoader.parse(data_string))
    expect(product.category).to eq 'Women’s Formalwear'
  end

  it 'can create a list of products from a data file' do
    product_data = 
    expect(File).to receive
  end

end