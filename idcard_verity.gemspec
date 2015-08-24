# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idcard_verity/version'

Gem::Specification.new do |spec|
  spec.name          = "idcard_verity"
  spec.version       = IdcardVerity::VERSION
  spec.authors       = ["lvjianwei"]
  spec.email         = ["lvjw@zhuopucapital.com"]

  spec.summary       = %q{中国身份证验证，包括地区，生日，校验位的验证。支持15位和18位身份证。}
  spec.description   = %q{中国身份证验证，包括地区，生日，校验位的验证。支持15位和18位身份证。}
  spec.homepage      = "https://github.com/leosaullv/idcard_verity"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
