class AqlController < ApplicationController
  def index
    if query_params
      @query = query_params[:aql]
      @result = AQL.query(@query)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_query
    #   @result = AQL.query(params[:aql])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def query_params
      params.permit(:aql)
    end
end
