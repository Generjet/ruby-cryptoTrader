class AssetsOwnersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_assets_owner, only: %i[ show edit update destroy ]
  # GET /assets_owners or /assets_owners.json
  def index
    @q = AssetsOwner.ransack(params[:q])
    @assets_owners = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
  end

  def upload_csv
    file = params[:file]
    return redirect_to assets_owners_path, notice: "ONLY CSV should be uploaded" unless file.content_type == "text/csv"

    # ==== UPLOAD =====
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')

    csv.each do |row|
      our_asset = AssetsOwner.create(email: row["Email"])

      our_asset.name = row['Name']
      our_asset.surname = row["Surname"]
      our_asset.email = row["Email"]
      our_asset.dockingStation = row["DockingStation"]
      our_asset.desktopModel = row["DesktopModel"] # enum
      our_asset.desktopSerial = row["DesktopSerial"]
      our_asset.laptop = row["Laptop"]
      our_asset.laptopSerial = row["LaptopSerial"]
      our_asset.monitor1 = row["Monitor1"]
      our_asset.monitor2 = row["Monitor2"]
      our_asset.monitor3 = row["Monitor3"]
      our_asset.location = row["Location"]
      our_asset.comment = row["Comment"]
      our_asset.sap_id = row["Sap_id"]
      our_asset.save
    end
    redirect_to assets_owners_path, notice: "hey! "
  end

  # GET /assets_owners/1 or /assets_owners/1.json
  def show
  end

  # GET /assets_owners/new
  def new
    @assets_owner = AssetsOwner.new
  end

  # GET /assets_owners/1/edit
  def edit
  end

  # POST /assets_owners or /assets_owners.json
  def create
    @assets_owner = AssetsOwner.new(assets_owner_params)

    respond_to do |format|
      if @assets_owner.save
        format.html { redirect_to assets_owner_url(@assets_owner), notice: "Assets owner was successfully created." }
        format.json { render :show, status: :created, location: @assets_owner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assets_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets_owners/1 or /assets_owners/1.json
  def update
    respond_to do |format|
      if @assets_owner.update(assets_owner_params)
        format.html { redirect_to assets_owner_url(@assets_owner), notice: "Assets owner was successfully updated." }
        format.json { render :show, status: :ok, location: @assets_owner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assets_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets_owners/1 or /assets_owners/1.json
  def destroy
    @assets_owner.destroy

    respond_to do |format|
      format.html { redirect_to assets_owners_url, notice: "Assets owner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assets_owner
      @assets_owner = AssetsOwner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assets_owner_params
      params.require(:assets_owner).permit(:name, :surname, :email, :position, :department, :dockingStation, :desktopModel, :desktopSerial, :laptop, :laptopSerial, :monitor1, :monitor2, :monitor3, :location, :comment, :sap_id)
    end
end
