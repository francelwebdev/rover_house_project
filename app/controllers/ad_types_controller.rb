class AdTypesController < ApplicationController
    def index
        @ad_types = AdType.all
    end
end
