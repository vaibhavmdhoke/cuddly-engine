# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Backend
- It stores product information (Name, Description, Price)
The API should be able to return
- A listing of products--- (done)
- A single product---(Done)
And accepts mandatory / optional parameters to
- Filter products based on specific categories or price 
- Sort products based on price (Done)
- Paginate products (done)
- A combination of all the above

Please provide documentation for the API endpoints.



Frontend
Use a frontend framework of your choice to create a Single Page Application (SPA) that
consumes the API.
It should
- Show a listing of multiple products (done)
- Show a product detail page for a single product upon clicking on one (Done)
- Have a feature to filter products by category or price range (You are free to define the range) (done, Defined range as shown in the mock, and kept the highest price as 100000)
- Have a feature to sort products by price (done)
- Have pagination (done)

For Category
1. Get all Categories
	/categories
	Example
	

Api Documentation 

For Products 

1. Using category 
	Pass this as data as 
	Example:
	{"product"=>{"category_id"=>"62"}}
	Url: /products?product%5Bcategory_id%5D=62


2. Using Multiple Price Range 
	Pass price data as
	Acceptable Parameters:
		`price` in array, with "firstNumber..secondNumber"
		firstNumber as lower limit for price range
		secondNumber as upper limit for price range
	Example:
	{"product"=>{"price"=>["25..50", "50..100"]}}
	Url: /products?product%5Bprice%5D%5B%5D=25..50&product%5Bprice%5D%5B%5D=50..100

3. Using Sorting on Price, currently sorting is only on price 
	Pass this as data as 
	Acceptable Parameters: 
		`asc` For asending Order
		`desc` For desending Order
	Example:
	{"product"=>{"sort"=>"asc"}}
	Url: /products?product%5Bsort%5D=asc

4. Using Pagination
	Pass this as data as 
	Acceptable Parameters:
		`page_size` Max size of response for the page
		`page` Corresponds to page number
	Example:
	{"product"=>{"page_size"=>"5", "page"=>"1"}}
	Url: /products?product%5Bcategory_id%5D=62

We can use the combination of all the above as follows
Example:
	{"product"=>{"category_id"=>"62", "price"=>["0..25", "25..50", "50..100"], "sort"=>"asc", "page_size"=>"5", "page"=>"1"}

Url: 
	"/products?product%5Bcategory_id%5D=62&product%5Bprice%5D%5B%5D=0..25&product%5Bprice%5D%5B%5D=25..50&product%5Bprice%5D%5B%5D=50..100&product%5Bsort%5D=asc&product%5Bpage_size%5D=5&product%5Bpage%5D=1"
