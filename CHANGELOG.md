# Unidom Geo China Change Log 中国地理领域模型引擎变更日志

## v0.1
1. Region model & migration (20010491560010)
2. Rake task unidom:geo:china:region:import

## v0.2
1. Town model & migration (20010491560020)
2. Improved the Region model to add the ``has_many :towns`` macro
3. Renamed the unidom:geo:china:import Rake task to unidom:geo:china:region:import
4. Implemented the unidom:geo:china:town:import Rake task
5. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.5

## v0.3
1. Improved the Region model to add the ``has_many :locatings`` macro
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v0.3.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v0.3.2
1. Improved the Region model to include the As Region concern

## v0.4
1. As Inferior Region concern
2. As Superior Region concern
3. Improved the Region model to include the As Inferior Region concern & the As Superior Region concern

## v0.4.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v0.4.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v0.4.3
1. Improved the Ruby Gem Specification to depend on [unidom-geo](https://github.com/topbitdu/unidom-geo) v1.4.2
2. Improved the Ruby Gem Specification to never depend on [unidom-common](https://github.com/topbitdu/unidom-common)

## v0.4.4
1. Improved the Ruby Gem Specification to depend on [unidom-geo](https://github.com/topbitdu/unidom-geo) v1.4.3

## v0.4.5
1. Improved the Ruby Gem Specification to depend on [unidom-geo](https://github.com/topbitdu/unidom-geo) v1.4.4
2. Improved the Engine class to include the Engine Extension concern

## v0.4.6
1. Improved the Ruby Gem Specification to depend on [unidom-geo](https://github.com/topbitdu/unidom-geo) v1.4.5
2. Improved the models to support the namespace neglecting

## v0.5
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v0.5.1
1. Improved the Region model for the validations on the #numeric_code attribute & the #name attribute
2. Improved the Town model for the validations on the #numeric_code attribute & the #name attribute
3. Improved the Region spec for the validations on the #numeric_code attribute, the #alphabetic_code attribute, & the #name attribute
4. Improved the Town spec for the validations on the #name attribute, & the #numeric_code attribute

## v0.5.2
1. Improved the Region model for the validations on the #name attribute
2. Improved the Region spec for the validations on the #name attribute
3. Improved the unidom:geo:china:region:import task for the updating when importing

## v0.5.3
1. Improve the Region spec for the ``has_many :towns, class_name: 'Unidom::Geo::China::Town'`` macro
2. Improve the Town spec for the ``belongs_to :region, class_name: 'Unidom::Geo::China::Region'`` macro

## v0.5.4
1. Improve the Region spec for the name_is scope, & the being_virtual scope
2. Improve the Town spec for the region_is scope

## v0.5.5
1. Improve the Region spec for the validations on the #alphabetic_code attribute, & the #name attribute
2. Improve the Town spec for the validations on the #name attribute

## v0.5.6
1. Improve the Region spec for the As Region concern
2. Improve the Ruby Gem Specification to depend on [unidom-geo](https://github.com/topbitdu/unidom-geo) v1.5.6

## v0.5.7
1. As Inferior Region shared examples
2. Improve the Region spec for the As Inferior Region concern

## v0.5.8
1. Improve the Region spec for the root_level scope, & the #under_mducg? method
