# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_elasticsearch_index'
  s.version     = '2.4.3'
  s.summary     = 'Index spree models to Elasticsearch server'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Isay Sosa'
  s.email     = 'yasnet21@gmail.com'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_development_dependency 'elasticsearch-model'
end
