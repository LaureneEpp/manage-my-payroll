class AllowancesController < ApplicationController
  before_action :set_allowance, only: %i[ show edit update destroy ]


  # GET /allowances or /allowances.json
  def index
    @allowances = Allowance.all.order('name ASC')
    @allowance = Allowance.new
  end

  # GET /allowances/1 or /allowances/1.json
  def show
  end

  # GET /allowances/new
  def new
    @allowance = Allowance.new
  end

  # GET /allowances/1/edit
  def edit
  end

  # allowance /allowances or /allowances.json
  # def create
  #   @allowance = Allowance.new(allowance_params)
  
  #   if @allowance.save
  #     respond_to do |format|
  #       format.html { redirect_to allowances_path, notice: "allowance was successfully created." }
  #       format.turbo_stream
  #     end
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
  def create
    @allowance = Allowance.new(allowance_params)

    if @allowance.save
      redirect_to allowances_url, notice: 'allowance was successfully created.'
    else
      render :new
    end
  end


  # def create
  #   @allowance = Allowance.new(allowance_params)
  #   respond_to do |format|
  #     if @allowance.save
  #       format.turbo_stream { render turbo_stream: turbo_stream.prepend('allowances', partial: 'allowances/allowance', locals: {allowance: @allowance}) }
  #       format.html { redirect_to allowances_path, notice: "allowance was successfully created." }
  #     end
  #   end
  # end


  # PATCH/PUT /allowances/1 or /allowances/1.json
  def update
    respond_to do |format|
      if @allowance.update(allowance_params)
        format.html { redirect_to allowance_url(@allowance), notice: "allowance was successfully updated." }
        format.json { render :show, status: :ok, location: @allowance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @allowance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allowances/1 or /allowances/1.json
  def destroy
    # @allowance.payslip_allowances.destroy
    @allowance.destroy

    respond_to do |format|
      format.html { redirect_to allowances_url, notice: "allowance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allowance
      @allowance = Allowance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def allowance_params
      params.require(:allowance).permit(:name, :description, :amount)
    end
end
