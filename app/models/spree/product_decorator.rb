module Spree
  Product.class_eval do
    include Elasticsearch::Model

    after_save { ElasticsearchIndexJob.enqueue('index', self) }
    after_destroy { ElasticsearchIndexJob.enqueue('delete', self) }
  end
end