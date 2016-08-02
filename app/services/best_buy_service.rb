class BestBuyService

  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def private
    def connection
      @_connection
    end
end
