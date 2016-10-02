module Unidom::Geo::China::Concerns::AsSuperiorRegion

  extend ActiveSupport::Concern

  included do |includer|

    def sub_regions
      if numeric_code_suffix_empty?
        prefix  = numeric_code_middle_empty? ? numeric_code_prefix : "#{numeric_code_prefix}#{numeric_code_middle}"
        regions = self.class.numeric_code_starting_with(prefix).not_numeric_coded_as(numeric_code)
        regions = regions.numeric_code_ending_with('00') if numeric_code_middle_empty?
        regions
      else
        self.class.none
      end
    end

  end

  module ClassMethods
  end

end
