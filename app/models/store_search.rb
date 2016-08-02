class StoreSearch
  attr_reader :zip
  
  def initialize(zip)
    @zip = zip
  end

  def self.get_stores(zip)
    new(zip).get_stores
  end

  def get_stores
    service.get_stores(zip)
  end

  private
  def service
    @service ||= SearchService.new
  end
end
