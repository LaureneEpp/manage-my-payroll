class DepartementsController < ApplicationController
  before_action :set_departement, only: %i[ show ]

  def index
    @hash_departement_teams = Team.all.group_by{|d|d.departement}
    # @departements = hash_departement_teams.@keys
    # @departements = Departement.all.order('name ASC')
    # @teams_d = Team.all.group_by{|d| d.departement}
    # @teams_departement = @departements.map {|t| t.teams }.map {|n| n}
    # @list_d = @departements.each do |d| d end
    # @teams_d = @list_d.map {|t| t.teams}
    # @team_per_departement = @teams_d.map {|n|n}.flatten
    # @teams = @departement.teams.build
    # @team_per_departement = @departements.map {|d| d.teams.map {|t| t.name}}
    # @teams_per_departement = Team.where(departement: d)
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_departement
    @departement = Departement.find(params[:id])
  end
end