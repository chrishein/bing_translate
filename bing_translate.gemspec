require 'rubygems'
spec = Gem::Specification.new do |s|
  s.name = 'bing_translate'
  s.version = '0.0.1'
  s.summary = "Simple Ruby Client for Bing Translate API"
  s.files = Dir.glob("**/**/**")
  s.test_files = Dir.glob("test/*_test.rb")
  s.author = "Christian Hein"
  s.email = "info@kumbel.com.ar"
  s.has_rdoc = false
  s.required_ruby_version = '>= 1.9.2'
  
  s.add_dependency 'httparty', '>=0.7.8'
end