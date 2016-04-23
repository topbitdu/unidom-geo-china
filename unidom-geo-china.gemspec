$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/geo/china/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-geo-china'
  spec.version     = Unidom::Geo::China::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-geo-china'
  spec.summary     = 'Unidom China Geo Domain Model Engine 中国地理领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The China Contact domain model engine includes Mobile Phone Number and its relative models. Unidom (统一领域对象模型)是一系列的领域模型引擎。中国地理领域模型引擎包括中国大陆的行政区划及其相关的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '~> 0.8'

end
