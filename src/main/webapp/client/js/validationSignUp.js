/* ----------------------------

	CustomValidation prototype

	- Keeps track of the list of invalidity messages for this input
	- Keeps track of what validity checks need to be performed for this input
	- Performs the validity checks and sends feedback to the front end

---------------------------- */

function CustomValidation(input) {
	this.invalidities = [];
	this.validityChecks = [];

	//add reference to the input node
	this.inputNode = input;

	//trigger method to attach the listener
	this.registerListener();
}

CustomValidation.prototype = {
	addInvalidity: function(message) {
		this.invalidities.push(message);
	},
	getInvalidities: function() {
		return this.invalidities.join('. \n');
	},
	checkValidity: function(input) {
		for ( var i = 0; i < this.validityChecks.length; i++ ) {

			var isInvalid = this.validityChecks[i].isInvalid(input);
			if (isInvalid) {
				this.addInvalidity(this.validityChecks[i].invalidityMessage);
			}

			var requirementElement = this.validityChecks[i].element;

			if (requirementElement) {
				if (isInvalid) {
					requirementElement.classList.add('invalid');
					requirementElement.classList.remove('valid');
				} else {
					requirementElement.classList.remove('invalid');
					requirementElement.classList.add('valid');
				}

			} // end if requirementElement
		} // end for
	},
	checkInput: function() { // checkInput now encapsulated

		this.inputNode.CustomValidation.invalidities = [];
		this.checkValidity(this.inputNode);

		if ( this.inputNode.CustomValidation.invalidities.length === 0 && this.inputNode.value !== '' ) {
			this.inputNode.setCustomValidity('');
		} else {
			var message = this.inputNode.CustomValidation.getInvalidities();
			this.inputNode.setCustomValidity(message);
		}
	},
	registerListener: function() { //register the listener here

		var CustomValidation = this;

		this.inputNode.addEventListener('keyup', function() {
			CustomValidation.checkInput();
		});


	}

};



/* ----------------------------

	Validity Checks

	The arrays of validity checks for each input
	Comprised of three things
		1. isInvalid() - the function to determine if the input fulfills a particular requirement
		2. invalidityMessage - the error message to display if the field is invalid
		3. element - The element that states the requirement

---------------------------- */

var usernameValidityChecks = [
	{
		isInvalid: function(input) {
			return input.value.length < 3;
		},
		invalidityMessage: 'This input needs to be at least 3 characters',
		element: document.querySelector('label[for="username"] .input-requirements li:nth-child(1)')
	},
	{
		isInvalid: function(input) {
			var illegalCharacters = input.value.match(/[^a-zA-Z0-9]/g);
			return illegalCharacters ? true : false;
		},
		invalidityMessage: 'Only letters and numbers are allowed',
		element: document.querySelector('label[for="username"] .input-requirements li:nth-child(2)')
	}
];

var passwordValidityChecks = [
	{
		isInvalid: function(input) {
			return input.value.length < 8 | input.value.length > 100;
		},
		invalidityMessage: 'This input needs to be between 8 and 100 characters',
		element: document.querySelector('label[for="password"] .input-requirements li:nth-child(1)')
	},
	{
		isInvalid: function(input) {
			return !input.value.match(/[0-9]/g);
		},
		invalidityMessage: 'At least 1 number is required',
		element: document.querySelector('label[for="password"] .input-requirements li:nth-child(2)')
	},
	{
		isInvalid: function(input) {
			return !input.value.match(/[a-z]/g);
		},
		invalidityMessage: 'At least 1 lowercase letter is required',
		element: document.querySelector('label[for="password"] .input-requirements li:nth-child(3)')
	},
	{
		isInvalid: function(input) {
			return !input.value.match(/[A-Z]/g);
		},
		invalidityMessage: 'At least 1 uppercase letter is required',
		element: document.querySelector('label[for="password"] .input-requirements li:nth-child(4)')
	},
	{
		isInvalid: function(input) {
			return !input.value.match(/[\!\@\#\$\%\^\&\*]/g);
		},
		invalidityMessage: 'You need one of the required special characters',
		element: document.querySelector('label[for="password"] .input-requirements li:nth-child(5)')
	}
];

var passwordRepeatValidityChecks = [
	{
		isInvalid: function() {
			return passwordRepeatInput.value != passwordInput.value;
		},
		invalidityMessage: 'This password needs to match the first one'
	}
];

var phoneNumberValidityChecks = [
	{
		isInvalid: function(input) {
			return input.value.length < 10 | input.value.length > 10;
		},
		invalidityMessage: 'The Phone Number contain 10 characters',
		element: document.querySelector('label[for="password"] .input-requirements li:nth-child(1)')
	},
	{
		isInvalid: function(input){
			return !input.value.match(/(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/);
		},
		invalidityMessage: 'Your phone number is not in the correct format!'
	}
];

var emailValidityChecks = [
	{
		isInvalid: function(input){
			return !input.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
		},
		invalidityMessage: 'Email is invalidate. Ex:Example@gmail.com'
	}
];

var nameValidityChecks = [
	{
		isInvalid: function(input){
			return input.value.length < 6 | input.value.length > 50;
		},
		invalidityMessage: 'This input needs to be between 6 and 50 characters'
	},
	{
		isInvalid: function(input){
			return input.value.match(/[\!\@\#\$\%\^\&\*]/g);
		},
		invalidityMessage: 'Name does not contain special characters'
	},
	{
		isInvalid: function(input){
			return input.value.match(/[0-9]/g);
		},
		invalidityMessage: 'Name does not contain numbers'
	},
	{
		isInvalid: function(input){
			return !input.value.match(/[a-z]/g);
		},
		invalidityMessage: 'Name must contain at least 1 word'
	}
];



/* ----------------------------

	Setup CustomValidation

	Setup the CustomValidation prototype for each input
	Also sets which array of validity checks to use for that input

---------------------------- */

var usernameInput = document.getElementById('userIDRegister');
var phoneInput = document.getElementById('InputPhoneNum');
var passwordInput = document.getElementById('passwordRegister');
var passwordRepeatInput = document.getElementById('password_repeat');
var emailInput = document.getElementById('InputEmail');
var nameInput = document.getElementById('nameInput');

usernameInput.CustomValidation = new CustomValidation(usernameInput);
usernameInput.CustomValidation.validityChecks = usernameValidityChecks;

phoneInput.CustomValidation = new CustomValidation(phoneInput);
phoneInput.CustomValidation.validityChecks = phoneNumberValidityChecks;

emailInput.CustomValidation = new CustomValidation(emailInput);
emailInput.CustomValidation.validityChecks = emailValidityChecks;

passwordInput.CustomValidation = new CustomValidation(passwordInput);
passwordInput.CustomValidation.validityChecks = passwordValidityChecks;

passwordRepeatInput.CustomValidation = new CustomValidation(passwordRepeatInput);
passwordRepeatInput.CustomValidation.validityChecks = passwordRepeatValidityChecks;

nameInput.CustomValidation = new CustomValidation(nameInput);
nameInput.CustomValidation.validityChecks = nameValidityChecks;

/* ----------------------------

	Event Listeners

---------------------------- */

var inputs = document.querySelectorAll('input:not([type="submit"])');


var submit = document.querySelector('input[type="submit"');
var form = document.getElementById('FromRegistration');

function validate() {
	for (var i = 0; i < inputs.length; i++) {
		inputs[i].CustomValidation.checkInput();
	}
}

submit.addEventListener('click', validate);
form.addEventListener('submit', validate);
