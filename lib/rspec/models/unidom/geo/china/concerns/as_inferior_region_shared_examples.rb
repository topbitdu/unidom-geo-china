shared_examples 'Unidom::Geo::China::Concerns::AsInferiorRegion' do |model_attributes|

  before :each do
  end

  after :each do
  end

  context do

    model = described_class.create! model_attributes

    context '#super_regions' do
      it 'should respond_to #super_regions method' do expect(model).to respond_to(:super_regions) end
    end

  end

end
