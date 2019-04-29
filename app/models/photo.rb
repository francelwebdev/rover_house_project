class Photo < ApplicationRecord
    mount_uploader :name, PhotosUploader

    belongs_to :property
    
    validates :name, presence: true
end
