module StackDriver
  class Error < Exception
    attr_reader :rest_exception
    def initialize(rest_exception)
      super(rest_exception.message)
      @rest_exception = rest_exception
    end
  end

  class NotFoundError < Error
    def initialize(rest_exception)
      super(rest_exception)
    end
  end
end