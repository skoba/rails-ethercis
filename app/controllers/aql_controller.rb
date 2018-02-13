class AqlController < ApplicationController
  def index
    @result = AQL.query(query_params[:aql]) if query_params
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_query
    #   @result = AQL.query(params[:aql])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def query_params
      params.require(:query).permit(:aql)
    end
end
