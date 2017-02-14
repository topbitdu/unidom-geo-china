##
# Town 是中国的乡或者镇。

class Unidom::Geo::China::Town < Unidom::Geo::China::ApplicationRecord

  self.table_name = 'unidom_china_towns'

  include Unidom::Common::Concerns::ModelExtension

  validates :numeric_code, length: { minimum: self.columns_hash['numeric_code'].limit }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name,         presence: true, length: { in: 2..self.columns_hash['name'].limit      }

  belongs_to :region, class_name: 'Unidom::Geo::China::Region'

  scope :region_is, ->(region) { where region_id: to_id(region) }

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Geo::China::Town'
