# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blockchain/wallet/version'

Gem::Specification.new do |spec|
  spec.name          = "blockchain-wallet"
  spec.version       = BlockchainWallet::VERSION
  spec.authors       = ["Sergey Tolmachev"]
  spec.email         = ["tolsi.ru@gmail.com"]
  spec.description   = "Blockchain.info Wallet API for Ruby"
  spec.summary       = ""
  spec.homepage      = ""
  spec.license       = "CC-BY"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "debase"
  spec.add_development_dependency "ruby-debug-ide"

  spec.add_dependency "immutable_struct"
  spec.add_dependency "oj"
end
