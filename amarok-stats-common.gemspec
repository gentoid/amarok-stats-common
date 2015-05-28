$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'amarok-stats-common/version'

Gem::Specification.new do |s|
  s.name        = 'amarok-stats-common'
  s.version     = AmarokStatsCommon::VERSION
  s.license     = 'MIT'
  s.author      = 'Viktor Lazarev'
  s.email       = 'taurus101v+amarok-stats@gmail.com'
  s.homepage    = 'https://github.com/gentoid/amarok-stats-common'
  s.summary     =
  s.description = 'Common for amarok-stats'

  s.files       = `git ls-files -- lib/*`.split("\n") + %w(LICENSE README.md)

  s.add_development_dependency 'facets'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
