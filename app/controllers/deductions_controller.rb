class DeductionsController < ApplicationController
  before_action :set_deduction, only: %i[ show edit update destroy ]


  # GET /deductions or /deductions.json
  def index
    @deductions = Deduction.all.order('name ASC')
    @deduction = Deduction.new
  end

  # GET /deductions/1 or /deductions/1.json
  def show
  end

  # GET /deductions/new
  def new
    @deduction = Deduction.new
  end

  # GET /deductions/1/edit
  def edit
  end

  # POST /deductions or /deductions.json
  def create
    @deduction = Deduction.new(deduction_params)
    if @deduction.save
      redirect_to deductions_url, notice: 'deduction was successfully created.'
    else
      render :new
    end
  end
  
  
  # def create
  #   @deduction = Deduction.new(deduction_params)

  #   respond_to do |format|
  #     if @deduction.save
  #       format.html { redirect_to deduction_url(@deduction), notice: "deduction was successfully created." }
  #       format.json { render :show, status: :created, location: @deduction }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @deduction.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /deductions/1 or /deductions/1.json
  def update
    respond_to do |format|
      if @deduction.update(deduction_params)
        format.html { redirect_to deduction_url(@deduction), notice: "deduction was successfully updated." }
        format.json { render :show, status: :ok, location: @deduction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deductions/1 or /deductions/1.json
  def destroy
    @deduction.destroy

    respond_to do |format|
      format.html { redirect_to deductions_url, notice: "deduction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deduction
      @deduction = Deduction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deduction_params
      params.require(:deduction).permit(:name, :description, :amount)
    end
end
