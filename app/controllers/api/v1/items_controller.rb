class Api::V1::ItemsController < ApiBaseController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    if Item.find(params[:id]).destroy
      render json: {}, status: 204
    else
      render "We were not able to delete this item"
    end
  end

  def create
    render json: Item.create(name: params["name"], description: params["description"], image_url: params["image_url"]),
           status: 201
  end
end
