# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'intercom_test/version'

Gem::Specification.new do |gem|
  gem.name          = 'intercom_test'
  gem.version       = IntercomTest::VERSION
  gem.authors       = ['Alberto Jimenez']
  gem.email         = ['ajl1@um.es']

  gem.description   = 'Intercom\'s Take Home Test'
  gem.summary       = 'Intercom\'s Take Home Test'
  gem.homepage      = 'https://github.com/albertjilaz/intercom_test'

  gem.metadata['homepage_uri'] = gem.homepage

  # Specify which files should be added to the gem when it is released.
  gem.files         = Dir['lib/**/*.rb', 'exe/*', 'bin/*', 'data/*']
  gem.bindir        = 'exe'
  gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.required_ruby_version = '> 2.3'

  gem.add_runtime_dependency 'json', '~> 2.3.0'
  gem.add_development_dependency 'bundler', '~> 2.0'
  gem.add_development_dependency 'byebug', '~> 11.0.1'
  gem.add_development_dependency 'rake', '~> 11.0'
  gem.add_development_dependency 'rspec', '~> 3.9.0'
  gem.add_development_dependency 'simplecov', '~> 0.17.1'
end
