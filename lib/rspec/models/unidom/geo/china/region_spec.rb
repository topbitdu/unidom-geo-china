require 'rspec/models/unidom/geo/china/concerns/as_inferior_region_shared_examples'

describe Unidom::Geo::China::Region, type: :model do

  before :each do
  end

  after :each do
  end

  it 'should consider Beijing under a municipality direct under central government' do
    region = described_class.numeric_coded_as('110000').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should consider Chaoyang under a municipality direct under central government' do
    region = described_class.numeric_coded_as('110105').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should consider Tainjin under a municipality direct under central government' do
    region = described_class.numeric_coded_as('120000').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should consider Nankai under a municipality direct under central government' do
    region = described_class.numeric_coded_as('120104').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should consider Shanghai under a municipality direct under central government' do
    region = described_class.numeric_coded_as('310000').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should consider Xuhui under a municipality direct under central government' do
    region = described_class.numeric_coded_as('310104').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should consider Chongqing under a municipality direct under central government' do
    region = described_class.numeric_coded_as('500000').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should consider Shapinba under a municipality direct under central government' do
    region = described_class.numeric_coded_as('500106').first_or_initialize
    expect(region.under_mducg?).to be_truthy
  end

  it 'should not consider Sichuan under a municipality direct under central government' do
    region = described_class.numeric_coded_as('510000').first_or_initialize
    expect(region.under_mducg?).to be_falsey
  end

  it 'should not consider Chengdu under a municipality direct under central government' do
    region = described_class.numeric_coded_as('510100').first_or_initialize
    expect(region.under_mducg?).to be_falsey
  end

  it 'should not consider Jinniu under a municipality direct under central government' do
    region = described_class.numeric_coded_as('510106').first_or_initialize
    expect(region.under_mducg?).to be_falsey
  end

  context do

    model_attributes = {
      scheme_id:        SecureRandom.uuid,
      scheme_type:      'Unidom::Geo::China::Scheme::Mock',
      numeric_code:     '999999',
      alphabetic_code:  'ZZZ',
      name:             'Some Region'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension',       model_attributes.merge(scheme_id: SecureRandom.uuid)
    it_behaves_like 'Unidom::Geo::Concerns::AsRegion',                model_attributes.merge(scheme_id: SecureRandom.uuid)
    it_behaves_like 'Unidom::Geo::China::Concerns::AsInferiorRegion', model_attributes.merge(scheme_id: SecureRandom.uuid)

    it_behaves_like 'validates', model_attributes.merge(scheme_id: SecureRandom.uuid), :numeric_code,
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

    it_behaves_like 'validates text', model_attributes.merge(scheme_id: SecureRandom.uuid), :alphabetic_code,
      length: 2..described_class.columns_hash['alphabetic_code'].limit
    it_behaves_like 'validates text', model_attributes.merge(scheme_id: SecureRandom.uuid), :name,
      length: 1..described_class.columns_hash['name'].limit

    town_1_attributes = {
      numeric_code: '1'*9,
      name:         'Some Town #1'
    }

    town_2_attributes = {
      numeric_code: '2'*9,
      name:         'Some Town #2'
    }

    it_behaves_like 'has_many', model_attributes.merge(scheme_id: SecureRandom.uuid), :towns, Unidom::Geo::China::Town, [ town_1_attributes, town_2_attributes ]

    it_behaves_like 'scope', :name_is, [
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid                        ) ], count_diff: 1, args: [ model_attributes[:name] ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid                        ) ], count_diff: 0, args: [ 'Another Region'        ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, name: 'Another Region') ], count_diff: 0, args: [ model_attributes[:name] ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, name: 'Another Region') ], count_diff: 1, args: [ 'Another Region'        ] }
    ]

    it_behaves_like 'scope', :being_virtual, [
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid               ) ], count_diff: 0, args: [       ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid               ) ], count_diff: 0, args: [ true  ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid               ) ], count_diff: 1, args: [ false ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, virtual: true) ], count_diff: 1, args: [       ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, virtual: true) ], count_diff: 1, args: [ true  ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, virtual: true) ], count_diff: 0, args: [ false ] }
    ]

    it_behaves_like 'scope', :root_level, [
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid                        ) ], count_diff: 0, args: [] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, numeric_code: '999900') ], count_diff: 0, args: [] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, numeric_code: '999000') ], count_diff: 0, args: [] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, numeric_code: '990000') ], count_diff: 1, args: [] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, numeric_code: '900000') ], count_diff: 1, args: [] },
      { attributes_collection: [ model_attributes.merge(scheme_id: SecureRandom.uuid, numeric_code: '000000') ], count_diff: 1, args: [] }
    ]

  end

end
