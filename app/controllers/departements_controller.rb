class DepartementsController < ApplicationController
  before_action :set_departement, only: %i[ show ]

  def index
    @tbd_dpt = Departement.where(name: 'TBD')
    @departements = Departement.all.order('name ASC').excluding(@tbd_dpt)
    Team.new
  end

  def show
  end

  private
  
  def set_departement
    @departement = Departement.find(params[:id])
  end
end