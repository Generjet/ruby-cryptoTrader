class ItAsset < ApplicationRecord
    # belongs_to :user
    validates :serial_number,   :uniqueness => true,
                                :on => :create

    # enums
    enum status: [:in_stock, :using, :repairing, :broken, :returned_to_OT]
    enum asset_type: [:laptop, :desktop, :monitor, :dockstation, :other] # :other => switch, tablet, headset гэх мэт

    after_initialize :set_asset_types, :if => :new_record?
    # before_update :set_author

    # def set_author
    #     self.edited_by = current_user.id
    # end

    def set_asset_types
        self.status ||= :in_stock
        self.asset_type ||= :laptop
    end

end
