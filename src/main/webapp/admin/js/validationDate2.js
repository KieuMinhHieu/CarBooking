var form = document.getElementById('createTripForm');
// const dayInput = form.querySelector('');
var dayInput = document.querySelectorAll('#exampleInputDate');
var submit = document.getElementById('createTrip');
var tripName=document.querySelectorAll('#exampleInputTripName');
var defaultTripName=document.querySelectorAll('#defaultTripName');
var timeStart=document.querySelectorAll('#timeStart');
function myFunction() {
    for (var i = 0; i < dayInput.length; i++) {
        // console.log("check day:"+dayInput[i].value!=null);
        if(dayInput[i].value!=null){
            const currentDate = new Date();
            let dayCheck = new Date(dayInput[i].value);
            if (currentDate > dayCheck) {
                 // console.log("cc"+currentDate > dayCheck);
                dayInput[i].setCustomValidity('Day Start must higher than current day!');
            } else {
                // console.log("oke");
                dayInput[i].setCustomValidity('');
                changName(i,dayInput[i].value);           
            }
        }
    }
}


submit.addEventListener('click', myFunction);
form.addEventListener('submit', myFunction);



function changName(i,day){
    // console.log(tripName.value==defaultTripName.value);
    //  console.log("tripName:"+tripName[i].value + "f");
    //  console.log("defaultTripName:"+defaultTripName[i].value+"f");
    // console.log(tripName[i].value.trim()==defaultTripName[i].value.trim());
    // if(tripName[i].value.trim()==defaultTripName[i].value.trim()){
        tripName[i].value=defaultTripName[i].value +" "+day;
    // }
}

function setNameTime(){
    for(var z=0;z<timeStart.length;z++){
        if(timeStart[z].value!=""){
            // console.log(timeStart[z].value);
            tripName[z].value += " at " + timeStart[z].value;
        }
    }
}