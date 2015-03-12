namespace :elastic_search do
  namespace :index do
    desc 'Index all products to ElasticSearch.'
    task products: [:environment] do
      Spree::Product.all.each do |product|
        SpreeElasticsearchIndex::Indexer.perform(:index, product)
      end
    end
  end
end