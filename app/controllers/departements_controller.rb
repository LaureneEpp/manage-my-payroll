class DepartementsController < ApplicationController
  before_action :set_departement, only: %i[ show ]

  def index
    @departements = Departement.all
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_departement
    @departements = Departement.find(params[:id])
  end

end
