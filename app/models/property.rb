class Property < ApplicationRecord
    include SearchCop

    search_scope :search do
        # attributes property_type: "property_type.name"
        # attributes ad_type: "ad_type.name"
        # attributes country: "country.name"
        attributes :property_type, :ad_type, :country, :city, :price, :area
    end


    PROPERTY_TYPES = ["Appartement", "Terrain", "Suite", "Motel", "Hôtel", "Maison", "Villa", "Parcelle", "Domaine", "Bureau", "Boutique", "Immeuble"].sort

    AD_TYPES = ["A louer", "A vendre"].sort

    COUNTRIES = ["Bénin", "Togo", "Gabon", "Cameroun", "Burkina Faso", "Niger", "Côte d’Ivoire"].sort

    belongs_to :user
    has_many_attached :photos, dependent: :purge

    accepts_nested_attributes_for :user

    validates :area, :description, :ad_type, :property_type, :price, :bedroom, :bathroom, :country, :city, presence: true

    validates :sponsored, inclusion: { in: [true, false], message: ". Vous devez cocher au moins une case." }

    validates :photos, attached: true, file_size: { less_than_or_equal_to: 3.megabyte }, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] }, limit: { min: 1, max: 3 }

    # validate :photos

    after_create :set_expiry_date

    private

    # def photos
    #     if !self.photos.attached?
    #         errors.add(:photos, "Vous n'avez pas ajouter de photo. Veuillez ajouter au moins une photo à l'annonce.")
    #     end


    #     self.photos.each do |photo|
    #         if photo.byte_size > 1.megabytes
    #             errors.add(:photos, "La taille de chacune des photos ne doit pas être supérieur à 1Mb.")
    #         elsif !photo.content_type.in?(['image/jpeg', 'image/png', 'image/jpg'])
    #             errors.add(:photos, "Chaque photo doit au format .jpeg, .jpg ou .png")
    #         end
    #     end
    # end

    def set_expiry_date
        expiry_date = Date.today + 30.days
        self.update_column(:expires_on, expiry_date)
    end

end