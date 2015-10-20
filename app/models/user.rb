class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable
         
    before_save :set_uuid
    def set_uuid
        self.uuid ||= SecureRandom.uuid
    end
end
