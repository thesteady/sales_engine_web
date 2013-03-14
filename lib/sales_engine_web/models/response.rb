module SalesEngineWeb
  class Response
    attr_reader :body, :status

    DEFAULT_BODY = ""

    def initialize(response = {})
      @body = response[:body] || DEFAULT_BODY
      @status = response[:status]
    end
  end
end
