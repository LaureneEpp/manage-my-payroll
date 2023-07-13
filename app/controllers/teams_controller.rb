class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show ]
  before_action :set_departement, only: %i[ show ]

  def index
    @teams = Team.all.order('name ASC')
  end

  def show
    @team_manager = Employee.find_by(team_id: @team, manager: true)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to departements_path, notice: 'A new team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
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
