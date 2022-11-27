
        
        <script>
            const dayInput=document.getElementById('InputDate');
            
            function getPreviousDay(date = new Date()) {
                const previous = new Date(date.getTime());
                previous.setDate(date.getDate() - 1);

                return previous;
              }
            function myFunction(){
                const currentDate=new Date();
                const previousDate=getPreviousDay(currentDate);
                let dayCheck=new Date(dayInput.value);
                if(previousDate>dayCheck){
                    console.log(previousDate);
                    document.getElementById('InputDate').setCustomValidity('Day Start must higher or equal current day!');
                    return false;
                }else{
                    document.getElementById('InputDate').setCustomValidity('');
                    return true;
                }
                return true;

            }
            var inputs = document.querySelectorAll('input:not([type="submit"])');


            var submit =  document.getElementById('updateCoupon');
            var form = document.getElementById('formUpdate');
            
            submit.addEventListener('click', myFunction);
            form.addEventListener('submit', myFunction);
    </script>
        <script>
            const dayInput2=document.getElementById('InputDateAdd');
            
            function getPreviousDay2(date2 = new Date()) {
                const previous2 = new Date(date2.getTime());
                previous2.setDate(date2.getDate() - 1);

                return previous2;
              }
            function myFunction2(){
                const currentDate2=new Date();
                const previousDate2=getPreviousDay(currentDate2);
                let dayCheck2=new Date(dayInput2.value);
                if(previousDate2>dayCheck2){
                    console.log(previousDate2);
                    document.getElementById('InputDateAdd').setCustomValidity('Day Start must higher or equal current day!');
                    return false;
                }else{
                    document.getElementById('InputDateAdd').setCustomValidity('');
                    return true;
                }
                return true;

            }
            var inputs2 = document.querySelectorAll('input:not([type="submit"])');


            var submit2 =  document.getElementById('AddCoupon');
            var form2 = document.getElementById('formAdd');
            
            submit2.addEventListener('click', myFunction2);
            form2.addEventListener('submit', myFunction2);
    </script>
