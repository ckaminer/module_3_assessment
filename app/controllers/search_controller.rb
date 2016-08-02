class SearchController < ApplicationController

  def index
    @stores = StoreSearch.get_stores(params[:zip])
    @count = StoreSearch.response_count(params[:zip])
  end

end
