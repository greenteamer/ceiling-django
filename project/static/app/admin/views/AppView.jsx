var React = require('react');
var ReactDOM = require('react-dom');
var Reflux = require('reflux');
var _ = require('underscore');
var AccountsStore = require('../stores/AccountsStore.js');
var AccountStore = require('../stores/AccountStore.js');
var AccountsActions = require('../actions/AccountsActions.js');
var IF = require('./IF.jsx');


const ProfileFields = React.createClass({
	render(){
		var profile = this.props.profile;
		return (
			<div className="panel">
				<h3>Здравствуйте {profile.first_name}</h3>
			</div>
		)
	}
})


const ProfileInfo = React.createClass({
	render(){
		console.log('ProfileInfo props: ', this.props.account);
		var acc = this.props.account;
		var places = _.map(acc.place_of_account, (place)=>{
			return (
				<div key={place.id} className="panel panel-default">
					<div className="panel-body">
						<p>{place.name}</p>
						<p>Район: {place.district.name}</p>
					</div>
				</div>
			)
		})

		return(
			<div>
				<h2>Текущие данные: </h2>
				<p>{acc.username}</p>
				<h4>Варианты мест для встреч:</h4>
				{places}
				<IF condition={acc.performer_of_account}>
					<ProfileFields profile={acc.performer_of_account} />
				</IF>
				<IF condition={acc.customer_of_account}>
					<ProfileFields profile={acc.customer_of_account} />
				</IF>
			</div>
		)
	
	}
})


const PerformerProfileForm = React.createClass({
	render(){
		return(
			<div>
				<h2>PerformerProfile Form</h2>
				<div className="well first-profile-form">
					<label htmlFor="#district">Имя Отчество</label>
					<input className="form-control" name="first_name" id="first-name" />
					<label htmlFor="#district">Фамилия</label>
					<input className="form-control" name="last_name" id="last-name" />
					<label htmlFor="#district">Телефон для связи</label>
					<input className="form-control" name="phone" id="phone" />
					<button className="btn btn-primary">Сохранить</button>
				</div>
			</div>
		)
	}
})


const PlaceForm = React.createClass({
	render(){
		return(
			<div>
				<h2>Place Form</h2>
				<div className="well first-profile-form">
					<label htmlFor={"#district"+this.props.id_form}>Район</label>
					<input className="form-control" name={"district"+this.props.id_form} id={"district"+this.props.id_form} />
					<label htmlFor={"#name"+this.props.id_form}>Ваше название места</label>
					<input className="form-control" name={"name"+this.props.id_form} id={"name"+this.props.id_form} />
					<button className="btn btn-primary">Сохранить</button>
				</div>
			</div>
		)
	}
})


const AppView = React.createClass({
	mixins: [
		Reflux.connect(AccountsStore,"accounts"),
		Reflux.ListenerMixins
	],
	getInitialState(){
		return {
			place_forms_count: 1,
			account: {}
		}
	},
	componentWillMount(){
		AccountsActions.getCurrentAccount()
	},
	componentDidMount(){
		this.listenTo(AccountStore, this.onAccountChange);
	},

	onAccountChange(account){
		this.setState({
			account: account
		})
	},
	addPlaceForm(){
		this.setState({
			place_forms_count: this.state.place_forms_count + 1
		})
	},
	render() {
		console.log('state accounts: ', this.state.accounts);
		console.log('state account: ', this.state.account);
		var place_forms = _.map(_.range(this.state.place_forms_count), (id_form)=>{
			return (
				<PlaceForm key={id_form} id_form={id_form} />)
		})
		return (
			<div className="row">
				<div className="col-xs-12 col-md-6"> 
					<PerformerProfileForm />
					{place_forms}
					<button className="btn btn-primary" onClick={this.addPlaceForm}>Добавить Place</button>
				</div>
				<div className="col-xs-12 col-md-6">
					<ProfileInfo account={this.state.account}/>
				</div>
			</div>
		)
	}
})


module.exports = AppView;