describe Unidom::Geo::China::Town, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      region_id:    SecureRandom.uuid,
      numeric_code: '1'*9,
      name:         'Some Town'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
