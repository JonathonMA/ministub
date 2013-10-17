module Ministub
  # Include this in your tests to get a stub method
  module TestHelper
    def stub(*args)
      Stub.new(*args)
    end
  end
end
