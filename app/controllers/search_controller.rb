class SearchController < ApplicationController

  def index
    @stores = StoreSearch.get_stores(params[:zip])
  end

end
