# Unidom Geo China 中国地理领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-geo-china.svg)](https://badge.fury.io/rb/unidom-geo-china)

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
