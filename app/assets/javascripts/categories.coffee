# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	Vue.component 'products-list',
		props: [ 'product' ]
		template: """"
			<div class='grid-item' v-bind:data-key="product.id">
				<img v-bind:src="product.image_url" />
				<span> {{ product.name}} </span></br>
				<span> {{product.description}} {{ product.price}} </span>
			</div>
		"""
	
	window.app1 = new Vue(
		el: '#test'
		data: 
			name: 'Hello Vue!',
			id: '',
			description: ',',
			products: [],
			checkedPrice: [],
			sortingFilter:''
			page: 1,
			totalResults: '',
			pageSize: 5
		mounted: ->
			console.log('<<<<<<<<<<<<<< M,ounted')

		methods: detectClick: ->
			@id = event.target.id
			event.stopPropagation()
			@name = $(event.target).data('name')
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
			return
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