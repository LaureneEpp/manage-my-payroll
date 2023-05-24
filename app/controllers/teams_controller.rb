class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show ]
  before_action :set_departement, 

  def index
    @teams = Team.all.order('name ASC')
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_departement
    @departement = Departement.find(params[:departement_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description, :departement_id)
  end
end
