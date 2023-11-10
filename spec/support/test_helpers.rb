module TestHelpers
  def concurrently(&block)
    conns     = ActiveRecord::Base.connection.pool.size - 1
    threads   = Array.new(conns) do |i|
      ActiveRecord::Base.connection_pool.with_connection do
        Thread.new(&block)
      end
    end
    threads.each(&:join)

    conns
  end
end

RSpec.configure do |config|
  config.include TestHelpers
  config.include ActionCable::TestHelper
  config.include ActiveSupport::Testing::Assertions
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request
end
