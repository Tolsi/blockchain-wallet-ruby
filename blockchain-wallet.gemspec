# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blockchain/wallet/version'

Gem::Specification.new do |spec|
  spec.name          = "blockchain-wallet"
  spec.version       = Blockchain::Wallet::VERSION
  spec.authors       = ["Sergey Tolmachev"]
  spec.email         = ["tolsi.ru@gmail.com"]
  spec.description   = "Blockchain.info Wallet API in Ruby"
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
