require 'test_helper'
module V1
  class ProductsControllerTest < ActionDispatch::IntegrationTest
    
    fixtures :all

    def test_products_page_with_categories_params
      get "/products", params: { product: {category_id: categories(:one).id }}
      
      assert_equal 200, status
      assert_equal 2, JSON.parse(response.body).length
    end

    def test_products_page_with_sorting
      get "/products", params: { product: {sort: 'asc' }}
      
      parsed_body = JSON.parse(response.body)
      assert_equal 200, status
      assert_equal 4, parsed_body.length
      products = Product.order(:price)
      assert_equal products.map(&:price), products.map{|i| i ['price']}
    end

    def test_products_page_with_pagination
      get "/products", params: { product: {page: 1, page_size: 2 }}

      
      parsed_body = JSON.parse(response.body)
      assert_equal 200, status
      assert_equal 2, parsed_body.length
    end

     def test_products_page_with_price_range_params
      get "/products", params: { product: {price: ['25..50'] }}
      
      parsed_body = JSON.parse(response.body)
      product_count = Product.where('price < 25').count
      assert_equal 200, status
      assert_equal product_count, parsed_body.length
    end


    def test_products_page_with_all_filters
      get "/products", params: { product: {page: 1, page_size: 2, category_id: categories(:one).id, sort: 'asc' }}

      
      parsed_body = JSON.parse(response.body)
      assert_equal 200, status
      assert_equal 2, parsed_body.length
      products = Product.order(:price)
      assert_equal products.map(&:price), products.map{|i| i ['price']}

    end


  end
end