class Property < ApplicationRecord
    include SearchCop

    search_scope :search do
        attributes property_type: "property_type.name"
        attributes ad_type: "ad_type.name"
        attributes country: "country.name"
        # attributes :price, :category, :ad_type, :country, :city, :location
    end

    PROPERTY_TYPES = ["Appartement", "Terrain", "Suite", "Motel", "Hôtel", "Maison", "Villa", "Parcelle", "Domaine", "Bureau", "Boutique", "Immeuble"].sort

    AD_TYPES = ["A louer", "A vendre"].sort

    COUNTRIES = ["Bénin", "Togo", "Gabon", "Cameroun", "Burkina Faso", "Niger", "Côte d’Ivoire"].sort

    belongs_to :user
    has_many_attached :photos

    accepts_nested_attributes_for :user

    # validates_associated :user, update_only: true

    validates :area, :description, :ad_typ, :property_type, :country, :city, presence: true

    validates :photos, attached: true, file_size: { less_than_or_equal_to: 1.megabyte }, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] }, limit: { min: 1, max: 3 }

end
