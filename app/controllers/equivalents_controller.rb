class EquivalentsController < ApplicationController
  before_action :set_equivalent, only: [:show, :edit, :update, :destroy]

  # GET /equivalents
  # GET /equivalents.json
  def index
    @equivalents = Equivalent.all
  end

  # GET /equivalents/1
  # GET /equivalents/1.json
  def show
  end

  # GET /equivalents/new
  def new
    @equivalent = Equivalent.new
  end

  # GET /equivalents/1/edit
  def edit
  end

  # POST /equivalents
  # POST /equivalents.json
  def create
    @equivalent = Equivalent.new(equivalent_params)

    respond_to do |format|
      if @equivalent.save
        format.html { redirect_to @equivalent, notice: 'Equivalent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @equivalent }
      else
        format.html { render action: 'new' }
        format.json { render json: @equivalent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equivalents/1
  # PATCH/PUT /equivalents/1.json
  def update
    respond_to do |format|
      if @equivalent.update(equivalent_params)
        format.html { redirect_to @equivalent, notice: 'Equivalent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @equivalent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equivalents/1
  # DELETE /equivalents/1.json
  def destroy
    @equivalent.destroy
    respond_to do |format|
      format.html { redirect_to equivalents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equivalent
      @equivalent = Equivalent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equivalent_params
      params.require(:equivalent).permit(:name, :url, :organization, :namespace)
    end
end
