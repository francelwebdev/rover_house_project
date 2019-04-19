class Property < ApplicationRecord
    belongs_to :ad_type
    belongs_to :property_type
    belongs_to :country
    belongs_to :user

    has_many_attached :photos, dependent: :purge

    validates_associated :property_type, :country

    validates :title, :price, :area, :description, presence: true
    # validates :photos, presence: { message: 'must be abided' }, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..3.megabytes }

    validate :validation_photos

    private

    def validation_photos
        if photos.attached?
            if photos.size > 3
                errors.add(:photos, "Vous ne pouvez pas ajouter plus de 3 photos.")
            else
               photos.each do |photo|
                if !photo.content_type.in?(["image/png", "image/jpg", "image/jpeg"])
                    errors.add(:photos, "doit être au format .png, .jpg ou .jpeg")
                elsif photo.byte_size > 3.megabytes
                    errors.add(:photos, "doit pas être supérieur a 3 Mb")
                end
            end
        end
    else
        errors.add(:photos, "La photo est absent")
    end
end
end
