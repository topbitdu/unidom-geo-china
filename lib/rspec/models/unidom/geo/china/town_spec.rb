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

    name_max_length = described_class.columns_hash['name'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :numeric_code,
      {                             } => 0,
      { numeric_code: nil           } => 3,
      { numeric_code: ''            } => 3,
      { numeric_code: '1'           } => 1,
      { numeric_code: '1'*8         } => 1,
      { numeric_code: 11_111_111    } => 1,
      { numeric_code: "-#{'1'*8}"   } => 1,
      { numeric_code: -11_111_111   } => 1,
      { numeric_code: '1'*9         } => 0,
      { numeric_code: 111_111_111   } => 0,
      { numeric_code: "-#{'1'*9}"   } => 2,
      { numeric_code: -111_111_111  } => 2,
      { numeric_code: '1'*10        } => 1,
      { numeric_code: 1_111_111_111 } => 1,
      { numeric_code: "#{'1'*8}A"   } => 1,
      { numeric_code: '111111.11'   } => 1,
      { numeric_code: 111111.11     } => 1

    it_behaves_like 'validates', model_attributes, :name,
      {              } => 0,
      { name: nil    } => 2,
      { name: ''     } => 2,
      { name: '1'    } => 1,
      { name: '11'   } => 0,
      { name: 'AA'   } => 0,
      { name: '111'  } => 0,
      { name: 'AAA'  } => 0,
      { name: '1'*(name_max_length-1) } => 0,
      { name: 'A'*(name_max_length-1) } => 0,
      { name: '1'*name_max_length     } => 0,
      { name: 'A'*name_max_length     } => 0,
      { name: '1'*(name_max_length+1) } => 1,
      { name: 'A'*(name_max_length+1) } => 1

    region_attributes = {
      scheme_id:        SecureRandom.uuid,
      scheme_type:      'Unidom::Geo::China::Scheme::Mock',
      numeric_code:     '999999',
      alphabetic_code:  'ZZZ',
      name:             'Some Region'
    }

    it_behaves_like 'belongs_to', model_attributes, :region, Unidom::Geo::China::Region, region_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :region_is, :region

  end

end
