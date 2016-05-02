var Reflux = require('reflux');
var AccountsActions = require('../actions/AccountsActions.js');
var _ = require('underscore');

// устанавливаем ключ 'products' для localStorage
// var localstorage_key = 'products';


var AccountStore = Reflux.createStore({
	listenables: [AccountsActions],

	updateObject: function(account){
        // меняем переменную products у нашего store
        this.account = account;
        // отправляем обновленный список товаров всем слушателям (ProductsView)
        this.trigger(account); 
    },

	onGetCurrentAccount(){
		$.ajax({
			url: '/api/accounts/current_user/',
			dataType: 'json',
			cache: false,
			success: (function(data){
				this.account = data[0];
				this.updateObject(data[0]);
				console.log("reflux account: ", data[0])
				// this.trigger(data);
			}).bind(this),
			error: (function(){
				console.log('ajax_error');
			}).bind(this)
		});	
	}

});


module.exports = AccountStore;