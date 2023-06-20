class DepartementsController < ApplicationController
  before_action :set_departement, only: %i[ show ]

  def index
    @departements = Departement.all.order('name ASC')

  end

  def show
  end

  private
  
  def set_departement
    @departement = Departement.find(params[:id])
  end
end