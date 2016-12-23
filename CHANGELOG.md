# Unidom Geo China Change Log 中国地理领域模型引擎变更日志

## v0.1
1. Region model & migration (20010491560010)
2. Rake task unidom:geo:china:region:import

## v0.2
1. Town model & migration (20010491560020)
2. Improved the Region model to add the ``has_many :towns`` association
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
1. Improve the Ruby Gem Specification to depend on [unidom-geo](https://github.com/topbitdu/unidom-geo) v1.4.2
2. Improve the Ruby Gem Specification to never depend on [unidom-common](https://github.com/topbitdu/unidom-common)

## v0.4.4
1. Improve the Ruby Gem Specification to depend on [unidom-geo](https://github.com/topbitdu/unidom-geo) v1.4.3
