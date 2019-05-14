class Property < ApplicationRecord
    include SearchCop

    search_scope :search do
        # attributes property_type: "property_type.name"
        # attributes ad_type: "ad_type.name"
        # attributes country: "country.name"
        attributes :property_type, :ad_type, :country, :city, :price, :area, :published
    end

    PROPERTY_TYPES = ["Appartement", "Terrain", "Suite", "Motel", "Hôtel", "Maison", "Villa", "Parcelle", "Domaine", "Bureau", "Boutique", "Immeuble"].sort

    AD_TYPES = ["A louer", "A vendre"].sort

    COUNTRIES = ["Bénin", "Togo", "Gabon", "Cameroun", "Burkina Faso", "Niger", "Côte d’Ivoire"].sort

    belongs_to :user, inverse_of: :properties
    has_many_attached :photos, dependent: :purge

    validates :area, :description, :ad_type, :property_type, :price, :bedroom, :bathroom, :country, :city, presence: true

    validates :sponsored, inclusion: { in: [true, false], message: ". Vous devez cocher au moins une case." }

    validate :each_photos

    after_create :set_expiry_date

    private

    def each_photos
        if photos.attached? == false
            errors.add(:photos, "Vous n'avez pas ajouter de photo. Veuillez ajouter au moins une photo à l'annonce.")
        elsif photos.size > 3
            errors.add(:photos, "3 photos maximum acceptés.")
        end
        photos.each do |photo|
            if photo.byte_size > 5.megabytes
                errors.add(:photos, "La taille de chacune des photos ne doit pas être supérieur à 1Mb.")
            elsif !photo.content_type.in?(['image/jpeg', 'image/png', 'image/jpg'])
                errors.add(:photos, "Chaque photo doit être au format .jpeg, .jpg ou .png")
            end
        end
    end

    def set_expiry_date
        expiry_date = Date.today + 30.days
        self.update_column(:expires_on, expiry_date)
    end

end