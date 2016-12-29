##
# As Inferior Region 是下级行政区划的关注点。

module Unidom::Geo::China::Concerns::AsInferiorRegion

  extend ActiveSupport::Concern

  included do |includer|

    def super_regions
      numeric_code_suffix_empty? ? (numeric_code_middle_empty? ? self.class.none : self.class.numeric_coded_as("#{numeric_code_prefix}0000")) : self.class.numeric_coded_as("#{numeric_code_prefix}#{numeric_code_middle}00")
    end

  end

  module ClassMethods
  end

end
