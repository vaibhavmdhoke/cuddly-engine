module V1
  class ProductsController < ApiController

    def index
      # binding.pry
      @search = Product.search do      
        any_of do
          product_params['price'].each {|range| with(:price, eval(range) )} if product_params['price'].present?
        end
        with(:category_id, product_params['category_id']) if product_params['category_id'].present?
        ## TODO: Do not sym, passed params
        order_by(:price, product_params[:sort].to_sym) if product_params[:sort].present?
        paginate :page => product_params['page'], :per_page => product_params['page_size']
      end
      json_response(@search.results)
    end

    def show
      # binding.pry
      @result = Product.find_by_id(params[:id])
      json_response(@result)
      # respond_to do |format|
      #   format.html
      #   format.json { render json: @result }
      # end
    end

    private

    def product_params
      params.require(:product).permit(:id, :category_id, :page, :page_size, :sort, price:[])
    end
    
  end
end
