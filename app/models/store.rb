class Store
  attr_reader :name, :city, :distance, :phone, :storeType

  def initialize(attrs)
    @name = attrs["longName"]
    @city = attrs["city"]
    @distance = attrs["distance"]
    @phone = attrs["phone"]
    @storeType = attrs["storeType"]
    @id = attrs["storeId"]
  end

end
