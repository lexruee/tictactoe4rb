# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tictactoe4rb/version'

Gem::Specification.new do |spec|
  spec.name          = "tictactoe4rb"
  spec.version       = Tictactoe4rb::VERSION
  spec.authors       = ["Roman Kuepper", "Alexander Rüedlinger"]
  spec.email         = ["rrkuepper@gmail.com", "a.rueedlinger@gmail.com"]
  spec.summary       = %q{A TicTacToe gem}
  spec.description   = %q{TicTacToe written in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
