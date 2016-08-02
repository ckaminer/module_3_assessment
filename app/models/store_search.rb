class StoreSearch

  def initialize(zip)
    @zip = zip
  end

  def self.get_stores(zip)
    new(zip).get_stores
  end

  def get_stores(zip)
    service.get_stores(zip)
  end

  private
  def service
    @service ||= SearchService.new
  end
end
