lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'voucher_code/version'

Gem::Specification.new do |spec|
  spec.name          = 'voucher_code'
  spec.version       = VoucherCode::VERSION
  spec.authors       = ['Eka Pramudita D.']
  spec.email         = ['edharmowongso@gmail.com']

  spec.summary       = %q{A simple gem to generate unique, random, and hard to guess coupon/voucher codes}
  spec.description   = %q{This project was inspired from https://github.com/rspective/voucher-code-generator-js}
  spec.homepage      = 'https://github.com/edharmowongso/voucher-code-generator-ruby'
  spec.license       = 'MIT'

  spec.require_paths = %w(lib)
  spec.required_ruby_version = '>= 2.0.0'
  spec.required_rubygems_version = '>= 1.3.5'
  spec.files = %w(voucher_code.gemspec) + Dir['*.md', 'bin/*', 'lib/**/*.rb', 'lib/**/**/*.rb']
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
