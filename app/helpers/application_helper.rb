module ApplicationHelper
    def user_info(id)
        # user = User.find(id)
        user = User.where(id: id).first
        return user
    end

    def user_by_email(email)
        user = User.where(email: email).first
        return user
    end

    def owned_assets(user_id)
        assets = ItAsset.where(owner_id: user_id)
        return assets
    end

    def find_by_sap(sap_id)
        user = User.where(sap_id: sap_id).first
        return user
    end

    def find_asset(serial_number)
        asset = ItAsset.where(serial_number: serial_number).first
        return asset
    end

end
