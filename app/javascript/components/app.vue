<template>
  <div id="app">

    <div id="sidebar">
        <li  class ='categories'> 
          <category-list v-bind:category = "category"
                        :key="category.id"
                        v-for="category in categories">
          </category-list>
            
        </li>
        </br>
        <label> Price Filter</label>
        </br>
          <div>
            <input type="checkbox" name="price" v-model="checkedPrice" value="0..25"> Under 25<br>
            <input type="checkbox" name="price" v-model="checkedPrice" value="25..50"> 25-50<br>
            <input type="checkbox" name="price" v-model="checkedPrice" value="50..100"> 50-100<br>
            <input type="checkbox" name="price" v-model="checkedPrice" value="100..150"> 100-150<br>
            <input type="checkbox" name="price" v-model="checkedPrice" value="150..200"> 150-200<br>
            <input type="checkbox" name="price" v-model="checkedPrice" value="250..300"> 250-300<br>
            <input type="checkbox" name="price" v-model="checkedPrice" value="300..100000"> Above 300<br>
          </div>
    </div>

    <div id="content">
    
      <div v-if="pageName === 'index'">
        <span class="s">{{ name}}</span>

        <label>Sort Order</label>
        <select v-model="sortingFilter">
          <option disabled value="1">Please select one</option>
          <option value="asc">Price: From Low To High </option>
          <option value="desc">Price: From High To Low</option>
        </select>


        <label>Page Size</label>
        <select v-model="pageSize">
          <option disabled value="1">Please select one</option>
          <option> 5 </option>
          <option> 10 </option>
          <option> 15 </option>
        </select>
        <a v-on:click="paginate" href="javascript:void(0);" data-paginate="backward">&laquo;</a>
         Current Page {{page}}
        <a v-on:click="paginate" href="javascript:void(0);" data-paginate="forward">&raquo;</a>
        <button v-on:click="applyFilter" > Apply </button>

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
      pageName: 'index',
      name: '',
      id: '',
      products: [],
      checkedPrice: [],
      sortingFilter: '',
      page: 1,
      totalResults: '',
      pageSize: 5,
      pageName: 'index',
      selectedProduct: '',
      categories:[]
    }
  },
  mounted: function () {
    let t = this
    $.ajax({
      url: "/categories",
      type: 'GET',
      dataType: 'json',
      contentType: 'application/json',
      success: function(response) {
        t.categories = response;
      }
    })
  },
  methods: {
    paginate: function() {
      if($(event.target).data('paginate') == 'forward'){
        if(this.products.length != 0){
          this.page = this.page + 1
          $(".s").find('#'+this.id).click()
        }
      }else{
        if(this.page > 1){
          this.page = this.page - 1
          $(".s").find('#'+this.id).click()
        }
      }
    },
    applyFilter: function(){
      $(".s").find('#'+this.id).click()
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
