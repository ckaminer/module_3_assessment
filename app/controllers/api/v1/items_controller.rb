class Api::V1::ItemsController < ApiBaseController

  def index
    render json: Item.all, each_serializer: ItemSerializer
  end

  def show
    render json: Item.find(params[:id]), serializer: ItemSerializer
  end

  def destroy
    Item.find(params[:id]).destroy
    render json: {head: :no_content, status: 204}
    # status: 204
  end
end
