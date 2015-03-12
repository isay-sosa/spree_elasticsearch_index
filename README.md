SpreeElasticsearchIndex
=======================

SpreeElasticsearchIndex allows you to index Spree models to an Elasticsearch server. Right now, it only allows to index products.

Installation
------------

Add spree_elasticsearch_index to your Gemfile:

```ruby
gem 'spree_elasticsearch_index'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_elasticsearch_index:install
```

To index Spree models add the following in to your `Rakefile`

```ruby
spec = Gem::Specification.find_by_name 'spree_elasticsearch_index'
load "#{spec.gem_dir}/lib/tasks/elastic_search.rake"
```

Then you can run `rake elastic_search:index:products` to index all products to Elasticsearch.

**Note** By default, models are indexed in `localhost:9200`. If you want to change it, you have to set an `ELASTICSEARCH_URL` env variable before running the rake tasks.

Copyright (c) 2015 [name of extension creator], released under the New BSD License
