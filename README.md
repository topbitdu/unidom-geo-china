# Unidom Geo China 中国地理领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-geo-china/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-geo-china.svg)](https://badge.fury.io/rb/unidom-geo-china)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-geo-china.svg)](https://gemnasium.com/github.com/topbitdu/unidom-geo-china)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The China Geo domain model engine includes the Region model and its migration.
Unidom (统一领域对象模型)是一系列的领域模型引擎。中国地理领域模型引擎包括中国大陆的行政区划模型及其数据迁移脚本。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-geo-china'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 2001049156.



## Import Data

```shell
bundle exec rake unidom:geo:china:region:import file=/china-region-data/NBS-county/20141031.csv from_date=2014-10-31 scheme_id= scheme_type=
bundle exec rake unidom:geo:china:town:import file=/china-region-data/NBS-town/20141031.csv from_date=2014-10-31 scheme_id= scheme_type=
```



## Call the Model

```ruby
Unidom::Geo::China::Region.root_level # All the 31 province-level regions including Beijing, Tianjin, etc.
Unidom::Geo::China::Region.numeric_coded_as('120000').valid_at.alive.first # Tianjin (天津)

active_locations = region.locations.valid_at.alive
active_towns     = region.towns.valid_at.alive
```

The Region model has a lot of domain knowlegde of the China regions.
- ```region.numeric_code_middle_empty?``` indicates whether the ```region``` is a province. 判断行政区划是否是一个省、直辖市、或者自治区。
- ```!region.numeric_code_middle_empty?&&region.numeric_code_suffix_empty?``` indicates whether the ```region``` is a city. 判断行政区划是否是一个地级市、地区、自治州、盟。
- ```!region..numeric_code_suffix_empty?``` indicates whether the ```region``` is a county. 判断行政区划是否是一个自治县、县级市、旗、自治旗、市辖区、林区、特区。
- ```region.mducg?``` indicates whether the ```region``` is a municipality direct under central government. 判断行政区划是否是一个直辖市。
-
```region.under_mducg?``` indicates whether the ```region``` is under any municipality direct under central government. 判断行政区划是否是一个直辖市的下级行政区划。
- ```region.under? another_region``` indicates the ```region``` is under the given another_region. 判断行政区划是否是一个给定行政区划的下级（含直接和间接下级）。
- ```region.super_regions``` returns a scope for the super regions of the ```region```. 返回找到 ```region``` 直接上级行政区划的查询 scope。
- ```region.sub_regions``` returns a scope for the sub regions of the ```region```. 返回找到 ```region``` 直接下级行政区划的查询 scope。



## Include the Concerns

```ruby
include Unidom::Geo::China::Concerns::AsInferiorRegion
include Unidom::Geo::China::Concerns::AsSuperiorRegion
```

### As Inferior Region

The As Inferior Region do the following tasks for the includer automatically:
1. Define the #super_regions method as: ``super_regions``

### As Superior Region

The As Superior Region do the following tasks for the includer automatically:
1. Define the #sub_regions method as: ``sub_regions``



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Geo::China
  }

end
```
