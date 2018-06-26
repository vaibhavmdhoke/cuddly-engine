/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

import Vue from 'vue/dist/vue.esm'
import App from '../components/app.vue'

global.jQuery = require('jquery');
var $ = global.jQuery;
window.$ = $;


document.addEventListener('DOMContentLoaded', () => {
  const app = Vue.component('category-list', {
    props: ['category'],
    template: "<li> <a class=\"s\" href=\"javascript:void(0);\"> <span v-bind:id=\"category.id\"  v-on:click=\"detectClick\" v-bind:data-name=\"category.name\"> {{ category.name}} </span> </a> </li>",
    methods: {
      detectClick: function() {
        event.stopPropagation()
        window.app.$children[0].id = event.target.id
        window.app.$children[0].name = $(event.target).data('name')
        window.app.$children[0].pageName = 'index'
        let t = this
        $.ajax({
          url: "/products",
          type: 'GET',
          data: {
            product: {
              category_id: window.app.$children[0].id,
              price: window.app.$children[0].checkedPrice,
              sort: window.app.$children[0].sortingFilter,
              page_size: window.app.$children[0].pageSize,
              page: window.app.$children[0].page
            }
          },
          dataType: 'json',
          contentType: 'application/json',
          success: function(response) {
            window.app.$children[0].products = response;
          }
        })
      }
    }

    
  });

})



document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  window.app = new Vue({
    el: 'app',
    data: {
      name: 'Hello Vue!'
      },
    template: '<App />',
    components: { App }
  })
  console.log(app)
})



document.addEventListener('DOMContentLoaded', () => {
  const app = Vue.component('products-list', {
    props: ['product'],
    template: "<div class='grid-item' v-bind:data-key=\"product.id\">\n <img v-bind:src=\"product.image_url\" />\n  <a href=\"javascript:void(0);\" class=\"detailPage\" v-bind:data-key=\"product.id\"  v-on:click=\"detailPageClick\">{{ product.name}}  ${{ product.price}} </a></div>",
    methods: {
      detailPageClick: function() {
        var id;
        id = $(event.target).data('key');
        window.app.$children[0].pageName = 'show';
        window.app.$children[0].description = "desctiotion >>> " + id;
        $.ajax({
          url: "/products/" + id,
          type: 'GET',
          dataType: 'json',
          contentType: 'application/json',
          success: function(response) {
            window.app.$children[0].selectedProduct = response;
          }
        });
      }
    }
  });

})

