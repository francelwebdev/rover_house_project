class Category < ApplicationRecord
    has_many :properties

    CATEGORY_TYPES = ["A louer", "A vendre"].sort

end
