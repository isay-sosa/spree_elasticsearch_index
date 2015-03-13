require 'active_job'

class ElasticsearchIndexJob < ActiveJob::Base
  queue_as :elasticsearch

  Client = Elasticsearch::Client.new host: (ENV['ELASTICSEARCH_URL'] || 'localhost:9200')

  def perform(action, model)
    type = type_from model.class.table_name

    case action
      when /index/
        Client.index index: 'spree', type: type, id: model.id, body: model.as_json
      when /delete/
        Client.delete index: 'spree', type: type, id: model.id
      else
        raise ArgumentError, "Unknown operation '#{action}'"
    end
  end

  private

  def type_from(table_name)
    table_name.gsub('spree_', '')
  end
end