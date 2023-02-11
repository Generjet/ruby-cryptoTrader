class User < ApplicationRecord
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :it_assets
  # nemelt tohirgoo
  enum status: [:working, :vacation, :leaved]
  enum role: [:simple_user, :it_engineer, :admin, :super_admin]
  enum position: [ :worker, :lead, :manager]
  enum department: [:unassigned,:turnover, :quality, :electricity, :civil_engineering, :mining]

  after_initialize :set_asset_types, :if => :new_record?
  def set_asset_types
      self.status ||= :working
      self.role ||= :simple_user
      self.position ||= :worker
      self.department ||= :unassigned
  end
end
