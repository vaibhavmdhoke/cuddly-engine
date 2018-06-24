module V1
  class CategoriesController < ApiController
    def index
      @categories = Category.all
      json_response(@categories)
    end
  end
end
