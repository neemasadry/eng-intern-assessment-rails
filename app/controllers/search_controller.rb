class SearchController < ApplicationController
  def index
    @pagy, @results = pagy(Article.search(params[:query]))
  end
end
