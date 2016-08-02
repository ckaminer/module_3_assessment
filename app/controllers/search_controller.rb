class SearchController < ApplicationController

  def index
    @stores = StoreSearch.get_stores(params[:zip])
    @count = StoreSearch.response_count(params[:zip])
  end

  def show
    @store = StoreSearch.get_store(params[:id])["stores"].first
  end

end
