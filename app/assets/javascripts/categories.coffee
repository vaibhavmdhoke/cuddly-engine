# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	Vue.component 'products-list',
		props: [ 'product' ]
		template: """"
			<div class='grid-item' v-bind:data-key="product.id">
				<img v-bind:src="product.image_url" />
				<a href="javascript:void(0);" class="detailPage" v-bind:data-key="product.id"  v-on:click="detailPageClick">{{ product.name}}  ${{ product.price}} </a>
			</div>
		"""
		methods:
			detailPageClick: ->
				id = $(event.target).data('key')
				app1.pageName = 'show'
				app1.description = "desctiotion >>> #{id}"

				$.ajax
					url: "/products/#{id}"
					type: 'GET'
					dataType: 'json'
					contentType: 'application/json'
					success: (response) ->
						app1.selectedProduct = response
						return
				return
	
	window.app1 = new Vue(
		el: '#sephoApp'
		data: 
			name: 'Hello Vue!',
			id: '',
			products: [],
			checkedPrice: [],
			sortingFilter:''
			page: 1,
			totalResults: '',
			pageSize: 5,
			pageName: 'index',
			selectedProduct: ''
		mounted: ->
			console.log('<<<<<<<<<<<<<< M,ounted')

		methods: 
			detectClick: ->
				@id = event.target.id
				event.stopPropagation()
				@name = $(event.target).data('name')
				@pageName = 'index'
				$.ajax
					url: "/products"
					type: 'GET'
					data: {product: {category_id: @id, price: @checkedPrice, sort: @sortingFilter, page_size: @pageSize, page: @page}}
					dataType: 'json'
					contentType: 'application/json'
					success: (response) ->
						window.app1.products = response
						return

					# response.pins[0].pin_data
				console.log('>>>>>>>>>>>>>>>>>>>>.')
				console.log("Name: #{@name} id: #{@id}")
				console.log('>>>>>>>>>>>>>>>')

		

			
	)

	
		# computed: 
    #     filteredFeatures: ->
    #       window.comp_app.getFeatures()
    #       return window.image_drawer_app.filterFeat()

	# window.app2 = new Vue(
	# 	el: '.categories'
	# 	data: id: 'Hello Vue!'
	# 	methods: reverseMessage: ->
	# 		@id = @id.split('').reverse().join('')
	# 		return
		
	# )