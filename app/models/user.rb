class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable
         
  validates :uuid, presence: true
  before_validation :ensure_uuid
  def ensure_uuid
      self.uuid ||= SecureRandom.uuid
  end
end
