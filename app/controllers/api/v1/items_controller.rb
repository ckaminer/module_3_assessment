class Api::V1::ItemsController < ApiBaseController

  def index
    render json: Item.all, each_serializer: ItemSerializer
  end
end