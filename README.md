SpreeElasticsearchIndex
=======================

SpreeElasticsearchIndex allows you to index Spree models to an Elasticsearch server. Right now, it only allows to index products.

Installation
------------

Add spree_elasticsearch_index to your Gemfile:

```ruby
gem 'spree_elasticsearch_index', github: 'iszandro/spree_elasticsearch_index'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
```

To index Spree models add the following in to your `Rakefile`

```ruby
spec = Gem::Specification.find_by_name 'spree_elasticsearch_index'
load "#{spec.gem_dir}/lib/tasks/elastic_search.rake"
```

Then you can run `rake elastic_search:index:products` to index all products to Elasticsearch.

**Note** By default, models are indexed in `localhost:9200`. If you want to change it, you have to set an `ELASTICSEARCH_URL` env variable before running the rake tasks.


Active Job
------------

In order to index or delete products to elasticsearch, it's necessary you create an initializer to set active job queue adapter.

Create an `active_job.rb` file inside `config/initializers`.

```ruby
require 'active_job'
# or any other supported backend such as :sidekiq or :delayed_job
ActiveJob::Base.queue_adapter = :inline
```

Active Job has built-in adapters for multiple queueing backends (Sidekiq, Resque, Delayed Job and others). To get an up-to-date list of the adapters see the API Documentation for [ActiveJob::QueueAdapters](http://api.rubyonrails.org/classes/ActiveJob/QueueAdapters.html).

SpreeElasticsearchIndex uses `active_jobs_default` as queue. So, if you are using Sidekiq, then you need to run it as `bundle exec sidekiq --queue active_jobs_elasticsearch --verbose`.

Copyright (c) 2015 [name of extension creator], released under the New BSD License
