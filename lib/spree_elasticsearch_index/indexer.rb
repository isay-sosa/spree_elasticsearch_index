module SpreeElasticsearchIndex
  class Indexer
    Client = Elasticsearch::Client.new host: (ENV['ELASTICSEARCH_URL'] || 'localhost:9200')

    def self.perform(operation, record)
      t = type record.class.table_name

      case operation.to_s
        when /index/
          Client.index index: 'spree', type: t, id: record.id, body: record.as_json
        when /delete/
          Client.delete index: 'spree', type: t, id: record.id
        else
          raise ArgumentError, "Unknown operation '#{operation}'"
      end
    end

    private

    def self.type(table_name)
      return table_name.gsub('spree_', '')
    end

  end
end