module Ministub
  # Simple stub for when OpenStruct doesn't quite cut it.
  class Stub
    def initialize(*args)
      @name = args.shift unless args.first.is_a? Hash

      @stubbed = args.first || {}
    end

    def inspect
      "#<Ministub(#{@name})>"
    end

    def stub!(name, value = nil, &block)
      if value
        @stubbed[name] = value
      elsif block
        @stubbed[name] = block
      else
        @stubbed[name] = nil
      end
    end

    def respond_to?(method)
      @stubbed.key?(method) || super
    end

    def method_missing(method, *args)
      if @stubbed.key? method
        stub = @stubbed[method]
        if stub.respond_to? :call
          stub.call(*args)
        else
          stub
        end
      else
        super
      end
    end
  end
end
