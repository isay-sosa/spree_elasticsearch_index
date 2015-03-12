module Spree
  Product.class_eval do
    include Elasticsearch::Model

    after_save { SpreeElasticsearchIndex::Indexer.perform(:index, self) }
    after_destroy { SpreeElasticsearchIndex::Indexer.perform(:delete, self) }
  end
end