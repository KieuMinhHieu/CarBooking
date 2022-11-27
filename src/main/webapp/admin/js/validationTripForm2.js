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


var tripNameValidityChecks = [
   {
      isInvalid: function(input){
         return !input.value.match(/[a-zA-Z]{1}/g);
      },
      invalidityMessage: 'Name must contain at least 1 word'
   }
];

var tripIdValidityChecks = [
   {
      isInvalid: function(input) {
         return input.value.length < 5;
      },
      invalidityMessage: 'This input have 5 characters',
   },
   {
      isInvalid: function(input){
         return !input.value.match(/[T]+([0-9]{4})/g);
      },
      invalidityMessage: 'Your input must start with "T" followed by 4 numbers! '
   }
];
var dayInputValidityChecks = [
   {
      isInvalid: function(input){
         const currentDate=new Date();
         let dayCheck=new Date(input.value);
         if (currentDate>dayCheck) {
            return  true;
         }    
      },
      invalidityMessage: 'Day Start must higher than current day!'
   }
];

/* ----------------------------

   Setup CustomValidation

   Setup the CustomValidation prototype for each input
   Also sets which array of validity checks to use for that input

---------------------------- */
var tripName = document.getElementById('exampleInputTripName');
var tripID = document.getElementById('exampleInputTripID');
const dayInput=document.getElementById('exampleInputDate');

tripName.CustomValidation = new CustomValidation(tripName);
tripName.CustomValidation.validityChecks = tripNameValidityChecks;

tripID.CustomValidation = new CustomValidation(tripID);
tripID.CustomValidation.validityChecks = tripIdValidityChecks;

dayInput.CustomValidation = new CustomValidation(dayInput);
dayInput.CustomValidation.validityChecks = dayInputValidityChecks;

/* ----------------------------

   Event Listeners

---------------------------- */

var inputs = document.querySelectorAll('input:not([type="submit"])');


var submit = document.querySelector('input[type="submit"');
var form = document.getElementById('createTripForm');

function validate() {
   for (var i = 0; i < inputs.length; i++) {
      inputs[i].CustomValidation.checkInput();
   }
}

submit.addEventListener('click', validate);
form.addEventListener('submit', validate);
