class ItAssetsController < ApplicationController
  load_and_authorize_resource
  require 'csv'
  before_action :authenticate_user!
  before_action :set_it_asset, only: %i[ show edit update destroy ]

  # GET /it_assets or /it_assets.json
  def index
    @q = ItAsset.ransack(params[:q])
    @it_assets = @q.result(distinct: true).paginate(page: params[:page], per_page: 20)

    # @it_assets = ItAsset.all.paginate(page: params[:page], per_page: 2)
  end

  def csv_update_import
    file = params[:file]
    return redirect_to csv_update_import_it_assets_path, notice: "ONLY CSV should be uploaded" unless file.content_type == "text/csv"

    # raise file.to_yaml # from edit.html.erb
    # raise current_user.to_yaml
    # ==== UPLOAD =====
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    # ItAsset.upsert_all([..,..,], unique_by: :serial_number) # consider it when necessary
    csv.each do |row|
      our_asset = ItAsset.find_by(serial_number: row["Serial number"])
      if our_asset.nil?
        our_asset = ItAsset.create(serial_number: row["Serial number"])
      end
      our_asset.name = row['Name']
      our_asset.detail = row["Detail"]
      our_asset.serial_number = row["Serial number"]
      our_asset.asset_type = row["Asset type"] # enum
      our_asset.status = row["Status"]
      our_asset.owner_id = row["Owner"]
      # ItAssets.rb model deer before_action shiideh
      # our_asset.registered_by = current_user.id
      # our_asset.edited_by = current_user.id  
      our_asset.save
    end
    redirect_to new_it_asset_path, notice: "hey! "
  end

  def import
    file = params[:file]
    return redirect_to new_it_asset_path, notice: "Only CSV file need! Arassoo?" unless file.content_type == "text/csv"

    # ==== UPLOAD ====
    # raise file.to_yaml
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    csv.each do |row|
      asset_hash = {}
      # raise row["detail"].to_yaml
      asset_hash[:name] = row['model_name']
      asset_hash[:detail] = row['detail']
      asset_hash[:serial_number] = row['serial_number']
      asset_hash[:asset_type] = row['asset_type']
      asset_hash[:status] = row['status']
      # owner_id haih heregtei, baihgui bol uusgeh
      # asset_hash[:owner_id] = row[:owner]
      # ItAsset.create_with(s234567fgh).find_or_create_by(serial_number: "s23-Star Engine")
      ItAsset.create_with(asset_hash).find_or_create_by(serial_number: row['serial_number'])
    end
    redirect_to new_it_asset_path, notice: "File is imported!"

  end

  # GET /it_assets/1 or /it_assets/1.json
  def show
  end

  # GET /it_assets/new
  def new
    @it_asset = ItAsset.new
  end

  # GET /it_assets/1/edit
  def edit
  end

  # POST /it_assets or /it_assets.json
  def create
    @it_asset = ItAsset.new(it_asset_params)
    @it_asset.registered_by = current_user.id
    # raise @it_asset.to_yaml

    respond_to do |format|
      if @it_asset.save
        format.html { redirect_to it_asset_url(@it_asset), notice: "It asset was successfully created." }
        format.json { render :show, status: :created, location: @it_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @it_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /it_assets/1 or /it_assets/1.json
  def update
    @it_asset.edited_by = current_user.id
    # raise @it_asset.to_yaml
    respond_to do |format|
      if @it_asset.update(it_asset_params)
        format.html { redirect_to it_asset_url(@it_asset), notice: "It asset was successfully updated." }
        format.json { render :show, status: :ok, location: @it_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @it_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /it_assets/1 or /it_assets/1.json
  def destroy
    @it_asset.destroy

    respond_to do |format|
      format.html { redirect_to it_assets_url, notice: "It asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_it_asset
      @it_asset = ItAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def it_asset_params
      params.require(:it_asset).permit(:owner, :name, :detail, :serial_number, :asset_type, :status, :owner_id, :registered_by, :edited_by)
    end
end
