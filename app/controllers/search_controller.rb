class SearchController < ApplicationController
  def index
    @query = Morador.ransack(params[:q])
    @moradors = @query.result(distinct: true)
  end
end
