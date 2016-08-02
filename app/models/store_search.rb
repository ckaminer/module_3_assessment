class StoreSearch
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def self.get_stores(zip)
    new(zip).get_stores
  end

  def get_stores
    stores = raw_store_responses["stores"].map do |store|
      Store.new(store)
    end
  end

  private
  def raw_store_responses
    service.get_stores(zip)
  end

  def service
    @service ||= SearchService.new
  end
end
