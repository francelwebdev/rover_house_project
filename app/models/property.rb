class Property < ApplicationRecord
    include SearchCop
    mount_uploaders :photos, PhotosUploader

    search_scope :search do
        attributes :title, :description, :price, :area, :property_type_id, :ad_type_id, :country_id, :city_id, :location, :address
        attributes ad_type: "ad_type.name"
        attributes property_type: "property_type.name"
end

belongs_to :ad_type
belongs_to :property_type
belongs_to :country
belongs_to :user

    # has_many :photos

    validates :title, :price, :area, :description, :ad_type_id, :property_type_id, :country_id, :address, presence: true

# validates_associated :photosp

    # validate :validation_photos

#     private

#     def validation_photos
#         if photos.attached?
#             if photos.size > 3
#                 errors.add(:photos, "Vous ne pouvez pas ajouter plus de 3 photos.")
#             else
#              photos.each do |photo|
#                 if !photo.content_type.in?(["image/png", "image/jpg", "image/jpeg"])
#                     errors.add(:photos, "doit être au format .png, .jpg ou .jpeg")
#                 elsif photo.byte_size > 3.megabytes
#                     errors.add(:photos, "doit pas être supérieur a 3 Mb")
#                 end
#             end
#         end
#     else
#         errors.add(:photos, "La photo est absent")
#     end
# end

end
