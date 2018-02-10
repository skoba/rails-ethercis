class CompositionsController < ApplicationController
  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @composition = Composition.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_composition
      @composition = Composition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def composition_params
      params.require(:composition).permit(:id, :name, :gender, :date_of_birth, :address, :phone, :ehr_id)
    end
end
