require 'product_loader'

describe ProductLoader do
  
  let(:data_string) { '(0%Mid Twist Cut-Out Dress, Pink%Women’s Formalwear%£540.00%5)' }

  it 'can parse a product data string' do
    expect(ProductLoader.parse(data_string)).to eq( [ '0', 
                                                      'Mid Twist Cut-Out Dress, Pink',
                                                      'Women’s Formalwear',
                                                      '£540.00',
                                                      '5' ] )
  end

  it 'can create a product from a parsed data string' do
    product = ProductLoader.create(ProductLoader.parse(data_string))
    expect(product.category).to eq 'Women’s Formalwear'
  end

  it 'can create a list of products from a data file' do
    expect(File).to receive(:read).and_return(data_string)
    product = ProductLoader.products_from('dummy.txt').first
    expect(product.price).to eq 540.00
  end

end