class Product < ApplicationRecord
  belongs_to :category

  searchable do

    integer :id
    text    :name
    text    :description
    integer :category_id, :multiple => true
    time    :created_at
    double  :price
  end
end
