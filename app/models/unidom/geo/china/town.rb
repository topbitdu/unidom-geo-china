# Town 是乡或者镇。

class Unidom::Geo::China::Town < ActiveRecord::Base

  self.table_name = 'unidom_china_towns'

  include Unidom::Common::Concerns::ModelExtension

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

  belongs_to :region, class_name: 'Unidom::Geo::China::Region'

  scope :region_is, ->(region) { where region_id: to_id(region) }

end