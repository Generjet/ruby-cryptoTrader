json.extract! assets_owner, :id, :name, :surname, :email, :position, :department, :dockingStation, :desktopModel, :desktopSerial, :laptop, :laptopSerial, :monitor1, :monitor2, :monitor3, :location, :comment, :sap_id, :created_at, :updated_at
json.url assets_owner_url(assets_owner, format: :json)
