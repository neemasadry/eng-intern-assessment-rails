class SearchController < ApplicationController
  before_action :set_query, only: :index

  def index
    if @query.empty?
      redirect_to root_path, flash: { warning: "Please enter valid search term(s) in the search field." }
    else
      @results = Article.search(@query)
    end
  end

  private

  def set_query
    @query = params[:query]
  end
end
