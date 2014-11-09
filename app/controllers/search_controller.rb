class SearchController < ApplicationController
  layout "search"
  def index
  end

  def search
    @terms = sanitize_terms(params["query"])
    @results = Question.search_by_text(@terms)
    render :results
  end

  private

  def sanitize_terms(str)
    str.split(" ").reject{ |term| term.size < 3 }
  end
end