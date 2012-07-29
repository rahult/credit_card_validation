# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "credit_card_validation/version"

Gem::Specification.new do |s|
  s.name        = "credit_card_validation"
  s.version     = CreditCardValidation::VERSION
  s.authors     = ["Rahul Trikha"]
  s.email       = ["rahul.trikha@gmail.com"]
  s.homepage    = "https://github.com/rahult/credit_card_validation"
  s.summary     = %q{Offline Credit Card Validator}
  s.description = %q{A credit card validation library to check offline validity of any AMEX, Discover, MasterCard, Visa cards using length and Luhn algorithm.}

  s.rubyforge_project = "credit_card_validation"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "turn"
  s.add_development_dependency "growl"
  s.add_development_dependency "minitest"
  s.add_development_dependency "guard-minitest"
end
