var Reflux = require('reflux');
var AccountsActions = require('../actions/AccountsActions.js');
var _ = require('underscore');

// устанавливаем ключ 'products' для localStorage
// var localstorage_key = 'products';


var AccountsStore = Reflux.createStore({
	// listenables: [ProductActions],

	updateList: function(accounts){
		// console.log('store updateList');
        // localStorage.setItem(localstorage_key, JSON.stringify(products));
        // меняем переменную products у нашего store
        this.accounts = accounts;
        // отправляем обновленный список товаров всем слушателям (ProductsView)
        this.trigger(accounts); 
    },

	getInitialState(){
		// получаем данные по ключу localstorage_key из localStorage
		// var loaded_products = localStorage.getItem(localstorage_key);

		// if (!loaded_products) {
			// если в localStorage нет данных берем их по api
			$.ajax({
				url: '/api/accounts/',
				dataType: 'json',
				cache: false,
				success: (function(data){
					this.accounts = data;
					this.updateList(data);
					console.log("reflux data: ", data)
					// this.trigger(data);
				}).bind(this),
				error: (function(){
					console.log('ajax_error');
				}).bind(this)
			});	
		// }else{
			// console.log('localStorage is not null');
			// this.products = JSON.parse(loaded_products);
		// }
		return this.accounts;
	}

});


module.exports = AccountsStore;