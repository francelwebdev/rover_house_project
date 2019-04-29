class Property < ApplicationRecord
    include SearchCop

    mount_uploaders :photos, PhotosUploader

    search_scope :search do
        attributes :price, :category, :ad_type, :country, :city, :location
    end

    AD_TYPES = ["A louer", "A vendre"].sort
    CATEGORIES = ["Appartement", "Terrain", "Suite", "Motel", "Hôtel", "Maison", "Villa", "Parcelle", "Domaine", "Bureau", "Boutique", "Immeuble"].sort
    COUNTRIES = ["Bénin", "Togo", "Gabon", "Cameroun", "Burkina Faso", "Niger", "Côte d’Ivoire"].sort

    belongs_to :user
    # has_many :photos, dependent: :destroy

    # accepts_nested_attributes_for :user
    # accepts_nested_attributes_for :photos

    # validates :title, :area, :description, :ad_type_id, :property_type_id, :country_id, :address, presence: true
    # validates_associated :photos

end
