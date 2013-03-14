require 'simplecov'

SimpleCov.start do
  add_filter "/spec"
end

require './lib/sales_engine_web/sales_engine_web'

SalesEngineWeb::Database.environment = :test

RSpec.configure do |config|
  config.around(:each) do |example|
    SalesEngineWeb::Database.database.transaction(:rollback => :always) do
      example.run
    end
  end
end

shared_context "standard output" do
  let(:output) {JSON.parse(last_response.body)}
end
