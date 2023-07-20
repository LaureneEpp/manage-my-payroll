class SearchController < ApplicationController
  def search
    @results = Employee.search(params[:search])
  end
end
