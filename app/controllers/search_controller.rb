class SearchController < ApplicationController

  def index
    @stores = Store.get_stores(params[:zip])
  end

end
