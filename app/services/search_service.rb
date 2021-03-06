class SearchService

  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def get_stores(zip, distance = 25)
    response = connection.get do |req|
      req.url "/v1/stores(area(#{zip},#{distance}))"
      req.params['apiKey'] = ENV["BEST_BUY_KEY"]
      req.params['format'] = "json"
      req.params['show'] = "longName,city,distance,phone,storeType,storeId"
    end
    parsed = parse(response)
  end

  def find_store(id)
    response = connection.get do |req|
      req.url "/v1/stores(storeId=#{id})"
      req.params['apiKey'] = ENV["BEST_BUY_KEY"]
      req.params['format'] = "json"
      req.params['show'] = "longName,address,city,region,postalCode,storeType"
    end
    parsed = parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private
    def connection
      @_connection
    end
end
