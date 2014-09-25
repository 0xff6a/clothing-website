require 'database_table'

describe DatabaseTable do
  
  let(:p1)    { double Product, id: 0, stock: 5       }
  let(:p2)    { double Product, id: 1, stock: 7       }
  let(:data)  { DatabaseTable.new([p1,p2])            }

  context 'initialisation' do

    it 'should hold a collection of objects' do
      expect(data.rows).to eq [p1,p2]
    end

  end

  context '#find_by' do

    it 'can find an object by id attribute' do
      expect(p1).to receive(:id)
      expect(data.find_by(:id, 0)).to eq p1
    end

    it 'can find an object by other unique attributes' do
      expect(data.find_by(:stock, 7)).to eq p2
    end

  end

end
