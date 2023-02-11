class AssetsMovementsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_assets_movement, only: %i[ show edit update destroy ]
  # GET /assets_movements or /assets_movements.json
  def index
    # @assets_movements = AssetsMovement.all
    @q = AssetsMovement.ransack(params[:q])
    @assets_movements = @q.result(distinct: true).paginate(page: params[:page], per_page: 20)
  end

  # GET /assets_movements/1 or /assets_movements/1.json
  def show
  end

  # GET /assets_movements/new
  def new
    @assets_movement = AssetsMovement.new
  end

  # GET /assets_movements/1/edit
  def edit
  end

  # POST /assets_movements or /assets_movements.json
  def create
    @assets_movement = AssetsMovement.new(assets_movement_params)

    respond_to do |format|
      if @assets_movement.save
        format.html { redirect_to assets_movement_url(@assets_movement), notice: "Assets movement was successfully created." }
        format.json { render :show, status: :created, location: @assets_movement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assets_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets_movements/1 or /assets_movements/1.json
  def update
    raise params[:created_at].to_yaml
    respond_to do |format|
      if @assets_movement.update(assets_movement_params)
        format.html { redirect_to assets_movement_url(@assets_movement), notice: "Assets movement was successfully updated." }
        format.json { render :show, status: :ok, location: @assets_movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assets_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets_movements/1 or /assets_movements/1.json
  def destroy
    @assets_movement.destroy

    respond_to do |format|
      format.html { redirect_to assets_movements_url, notice: "Assets movement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assets_movement
      @assets_movement = AssetsMovement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assets_movement_params
      params.require(:assets_movement).permit(:serial_number, :from_who, :to_who, :registered_by, :edited_by)
    end
end
