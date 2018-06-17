class ProductsController < ApplicationController


  def index
    @search = Product.search do      
      any_of do
        # You can write more or can make it dynamic as per your requirement
        # It is only for example that will help you in understanding that
        # In that way you will see the whole data filtered as per the specified ranges
        with(:pricing, 1..100)
        with(:pricing, 101..200) 
        with(:pricing, 201..300) 
        with(:pricing, 301..400) 
        with(:pricing, 401..500)  
      end
    end
    @search.results
  end
  
end
