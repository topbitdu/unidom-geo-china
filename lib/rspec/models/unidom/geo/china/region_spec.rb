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

    name_max_length = described_class.columns_hash['name'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :numeric_code,
      {                         } => 0,
      { numeric_code: nil       } => 3,
      { numeric_code: ''        } => 3,
      { numeric_code: '1'       } => 1,
      { numeric_code: '11'      } => 1,
      { numeric_code: '111'     } => 1,
      { numeric_code: '1111'    } => 1,
      { numeric_code: '11111'   } => 1,
      { numeric_code: 11111     } => 1,
      { numeric_code: '-11111'  } => 1,
      { numeric_code: -11111    } => 1,
      { numeric_code: '111111'  } => 0,
      { numeric_code: 111111    } => 0,
      { numeric_code: '-111111' } => 2,
      { numeric_code: -111111   } => 2,
      { numeric_code: '1111111' } => 1,
      { numeric_code: 1111111   } => 1,
      { numeric_code: '11111A'  } => 1

    it_behaves_like 'validates', model_attributes, :alphabetic_code,
      {                         } => 0,
      { alphabetic_code: nil    } => 0,
      { alphabetic_code: ''     } => 0,
      { alphabetic_code: '1'    } => 1,
      { alphabetic_code: '11'   } => 0,
      { alphabetic_code: 'AA'   } => 0,
      { alphabetic_code: '111'  } => 0,
      { alphabetic_code: 'AAA'  } => 0,
      { alphabetic_code: '1111' } => 1,
      { alphabetic_code: 'AAAA' } => 1

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 2,
      { name: ''    } => 2,
      { name: '1'   } => 0,
      { name: 'A'   } => 0,
      { name: '11'  } => 0,
      { name: 'AA'  } => 0,
      { name: '111' } => 0,
      { name: 'AAA' } => 0,
      { name: '1'*(name_max_length-1) } => 0,
      { name: 'A'*(name_max_length-1) } => 0,
      { name: '1'*name_max_length     } => 0,
      { name: 'A'*name_max_length     } => 0,
      { name: '1'*(name_max_length+1) } => 1,
      { name: 'A'*(name_max_length+1) } => 1

  end

end
