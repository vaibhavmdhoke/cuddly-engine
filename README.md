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
- A single product---(WIP)
And accepts mandatory / optional parameters to
- Filter products based on specific categories or price [I have chosen range as given in the mockup( https://drive.google.com/file/d/1IvC3_VNX7P6rxmYdy0bJ1MeetQyQRagw/view)]
- Sort products based on price (Done)
- Paginate products (done)
- A combination of all the above
Please provide documentation for the API endpoints.



Frontend
Use a frontend framework of your choice to create a Single Page Application (SPA) that
consumes the API.
It should
- Show a listing of multiple products (done)
- Show a product detail page for a single product upon clicking on one (WIP)
- Have a feature to filter products by category or price range (You are free to define the range) (done, Defined range as shown in the mock, and kept the highest price as 100000)
- Have a feature to sort products by price (done)
- Have pagination (WIP)