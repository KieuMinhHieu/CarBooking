var form = document.getElementById('createTripForm');
// const dayInput = form.querySelector('');
var dayInput = document.querySelectorAll('#exampleInputDate');
var submit = document.getElementById('createTrip');
var tripName=document.getElementById('exampleInputTripName');
function myFunction() {
    for (var i = 0; i < dayInput.length; i++) {
        // console.log("day dayInput: "+dayInput[i].value)
        const currentDate = new Date();
        //console.log(currentDate);
        let dayCheck = new Date(dayInput[i].value);
        // console.log("daycheck "+dayCheck);
        if (currentDate > dayCheck) {
            console.log(currentDate > dayCheck);
            dayInput[i].setCustomValidity('Day Start must higher than current day!');

        } else {
            console.log("oke");
            dayInput[i].setCustomValidity('');           
        }
        changName(dayInput[i].value);
    }
}


submit.addEventListener('click', myFunction);
form.addEventListener('submit', myFunction);


function changName(day){
    if(day!=null){
        tripName.value=tripName.value + day;
    }
}