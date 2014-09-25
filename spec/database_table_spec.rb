require 'database_table'

describe DatabaseTable do
  
  let(:p1)    { double Product, id: 0       }
  let(:p2)    { double Product, id: 1       }
  let(:data)  { DatabaseTable.new([p1,p2])  }

  context 'initialisation' do

    it 'should hold a collection of objects' do
      expect(data.rows).to eq [p1,p2]
    end

  end

end
