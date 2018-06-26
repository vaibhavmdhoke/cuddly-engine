class LandingController < ApplicationController
 def index
      @categories = Category.all
  end
end

# class CategoriesController < ApiController
      
  #   def index
  #     @categories = Category.all
  # end
#  end