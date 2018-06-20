class Product < ApplicationRecord
  belongs_to :category

  searchable do

    integer :id
    text    :name
    text    :description
    integer :category_id, :multiple => true
    time    :created_at
    double  :price
    # facet   :price, price_range
  end
  # search = Product.search do
  #   with(:price, 0..25)
  #   with(:price,  25..50)
  #   with(:price,  50..100)
  #   with(:price,  100..150)
  #   with(:price,  150..200)
  #   with(:price,  250..300)
  #   with(:price,  300..100000)
  # end
  # results = search.results
end

# "0..25"
# "25..50"
# "50..100"
# "100..150"
# "150..200"
# "250..300"
# "300..100000"
