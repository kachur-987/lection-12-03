class Photo < ApplicationRecord
    mount_uploaders :images, PhotoUploader
    serialize :images, JSON
    
    belongs_to :user
    belongs_to :category
end
