class Profile < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    
    belongs_to :user
    
    validates :nickname, presence: true
    validates :nickname, uniqueness: true
end
