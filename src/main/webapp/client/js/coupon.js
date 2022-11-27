

var count = 1;
var group = document.getElementById('listone');
var list_group = group.querySelector('li ul');
var list_array = group.querySelectorAll('li ul li');
var search = group.getElementsByTagName('input')[0];
var couponID = document.getElementById('couponID');


search.addEventListener('input', function (e) {
    for (var i = 0; i < list_array.length; i++) {
        matching(list_array[i])
    }
});

function matching(item) {
    if (item.innerHTML==search.value) {
        changeColor();
        copy_paste(item);
        // console.log(couponID.value); 
        // console.log(search.value); 
        changeFunc(item.value);
        // console.log(couponID.innerHTML);
        document.getElementById('oke').style.display='block';     
    } else {
    	couponID.value="";
        changeBack();
        count = 0;
        changeDefault();
    }
}


function copy_paste(item) {
    couponID.value = item.innerHTML;
    // todo : check match of list text and input value for .current 
    hide_list(list_group);
}

function hide_list(ele) {
    ele.dataset.toggle = 'false'
}

function changeColor(){
    search.style.borderColor = "#189905";
}

function changeBack(){
    search.style.borderColor = "#929991";
}

var defaultTotalPrice=document.getElementById("default-totalPrice");
var accountBalance=document.getElementById('accountBalance');

function changeFunc(item) {
	var resetTotal=defaultTotalPrice.value - defaultTotalPrice.value * (item/100);
	document.getElementById("totalPrice").value=resetTotal;
	document.getElementById("totalPrice-span").innerHTML=resetTotal + 'VND' ;
	
	var totalPrice=document.getElementById("totalPrice");
	if (parseFloat(accountBalance.value)>=parseFloat(resetTotal)) {
		document.getElementById('payingAccount').style.display='block';
		//console.log("totalPrice: "+totalPrice.value);
	}else{
		 document.getElementById('payingAccount').style.display='none';
		// console.log("not");
	}
}

function changeDefault(){
	document.getElementById("totalPrice").value=defaultTotalPrice.value;
	document.getElementById("totalPrice-span").innerHTML=defaultTotalPrice.value + 'VND' ;
	document.getElementById('oke').style.display='none';
	// console.log("accountBalance:" + accountBalance.value);
	// console.log("defaultTotalPrice:" + defaultTotalPrice.value);
	// console.log("Compare:" + accountBalance.value>defaultTotalPrice.value);
	if (parseFloat(accountBalance.value)>=parseFloat(defaultTotalPrice.value)) {
		document.getElementById('payingAccount').style.display='block';
	}else{
		 document.getElementById('payingAccount').style.display='none';
	}

}
