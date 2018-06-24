<template>
  <div id="app">

    <div id="sidebar">
        <li  class ='categories'> 
          <category-list v-bind:category = "category"
                        :key="category.id"
                        v-for="category in categories">
          </category-list>
            
        </li>

      <p>{{ message }}<p>
          <div>
            <input type="checkbox" name="price"  v-model="checkedPrice" value="0..25"> Under 25<br>
            <input type="checkbox" name="price"  v-model="checkedPrice" value="25..50"> 25-50<br>
            <input type="checkbox" name="price"  v-model="checkedPrice" value="50..100"> 50-100<br>
            <input type="checkbox" name="price"  v-model="checkedPrice" value="100..150"> 100-150<br>
            <input type="checkbox" name="price"  v-model="checkedPrice" value="150..200"> 150-200<br>
            <input type="checkbox" name="price"  v-model="checkedPrice" value="250..300"> 250-300<br>
            <input type="checkbox" name="price"  v-model="checkedPrice" value="300..100000"> Above 300<br>
          </div>
          {{checkedPrice}}
    </div>

    <div id="content">
    
      <div v-if="pageName === 'index'">
        <span class="s">{{ name}}</span>
        <select v-model="sortingFilter">
          <option disabled value="1">Please select one</option>
          <option value="asc">Price: From Low To High </option>
          <option value="desc">Price: From High To Low</option>
        </select>
        <span>Selected: {{ sortingFilter }}</span>

        <select v-model="pageSize">
          <option disabled value="1">Please select one</option>
          <option> 5 </option>
          <option> 10 </option>
          <option> 15 </option>
        </select>
        <span>Selected: {{ pageSize }}</span>

        <div class="pagination">
          <a href="#">&laquo;</a>
          <a href="#">1</a>
          <a class="active" href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a>
          <a href="#">5</a>
          <a href="#">6</a>
          <a href="#">&raquo;</a>
        </div>

        <div class='grid-container'>
          <products-list v-bind:product = "product"
                        :key="product.id"
                        v-for="product in products">
          </products-list>
            
        </div>
      </div>

      <div v-else>
          
          <h1>Name: {{selectedProduct.name }}</h1>
          <h1>Price: {{selectedProduct.price }}</h1>
          <h1>Description: {{selectedProduct.description }}</h1>
          <img v-bind:src=selectedProduct.image_url />
          
      </div>
    </div>

  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      pageName: 'index',
      name: 'this',
      id: '',
      products: [],
      checkedPrice: [],
      sortingFilter: '',
      page: 1,
      totalResults: '',
      pageSize: 5,
      pageName: 'index',
      selectedProduct: '',
      categories:[{name: 'test>>>>', id: 4}, {name: 'test>>>>2', id: 7}]
    }
  },
  methods: {
    detectClick: function() {
      event.stopPropagation()
      this.id = event.target.id

      this.name = $(event.target).data('name')
      this.pageName = 'index'
      let t = this
        
        
        $.ajax({
          url: "/products",
          type: 'GET',
          data: {
            product: {
              category_id: this.id,
              price: this.checkedPrice,
              sort: this.sortingFilter,
              page_size: this.pageSize,
              page: this.page
            }
          },
          dataType: 'json',
          contentType: 'application/json',
          success: function(response) {
            t.products = response;
          }
        })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.s{
    font-weight:700;
    color:#f39
}
</style>
