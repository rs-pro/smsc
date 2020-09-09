$:.push File.expand_path("../lib", __FILE__)
require "smsc_client/version"
Gem::Specification.new do |s|
  s.name        = 'smsc_client'
  s.version     = SmscClient::VERSION
  s.date        = '2020-09-09'
  s.summary     = "smsc_client"
  s.description = "https://smsc.ru client for ruby on rails"
  s.authors     = ["Igor"]
  s.email       = 'work.ttyigor@gmail.com'
  s.files       = ["lib/smsc_client.rb"]
  s.license     = 'MIT'
end