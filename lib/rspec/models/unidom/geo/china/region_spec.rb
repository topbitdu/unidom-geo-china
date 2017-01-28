describe Unidom::Geo::China::Region, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      scheme_id:        SecureRandom.uuid,
      scheme_type:      'Unidom::Geo::China::Scheme::Mock',
      numeric_code:     '999999',
      alphabetic_code:  'ZZZ',
      name:             'Some Region'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
