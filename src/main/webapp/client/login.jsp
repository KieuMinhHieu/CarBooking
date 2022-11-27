<%-- 
    Document   : login
    Created on : Oct 12, 2022, 11:05:45 PM
    Author     : KieuMinhHieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .modal-button{
        color: #007bff;
        background: none;
        border: none;
    }
    .modal-button:hover{
        color: #007bff;
        background: none;
        border: none;
    }
    .modal-button:focus{
        color: #007bff;
        background: none;
        border: none;
        box-shadow: none;
    }
</style>
<!--        Login Form-->

<div class="modal fade col-lg-12" id="loginForm" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title caps"><strong>Welcome Back!</strong></h4>
            </div>
            <div class="modal-body col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-2">
                            <form class="registration user" id="registration" action="${pageContext.request.contextPath}/user" method="post" >
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                           id="userID" aria-describedby="emailHelp"autocomplete="off"
                                           placeholder="Enter Account..." name="userID" oninput="checkUserID()"value="${requestScope.USERID}">
                                    <p style="color: red;margin: 10px 0 0 20px;" id="error">${requestScope.ERROR_LOGIN1}</p>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user"autocomplete="off"
                                           id="password" placeholder="Password" name="password" oninput="checkPassword()" >
                                    <p style="color: red;margin: 10px 0 0 20px;" id="errorPassword">${requestScope.ERROR_LOGIN2}</p>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox small">
                                        <input type="checkbox" class="custom-control-input" id="customCheck" value="lsRememberMe">
                                        <label class="custom-control-label" for="customCheck">Remember
                                            Me</label>
                                    </div>
                                </div>
                                <div class="g-recaptcha" data-sitekey="6LcFThUiAAAAAEZk9isOhp_hFXnYQpQPjQtRdU17"></div>
                                <p style="color: red;margin: 10px 0 0 20px;" id="errorPassword">${requestScope.ERROR_RECAPTCHA}</p>

                                <input style="margin-top: 10px" onclick="lsRememberMe()" type="submit" class="btn btn-primary btn-user btn-block" name="action" value="Login">
                                <hr>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/ETrans/login&response_type=code
                                   &client_id=199152751272-83nokhduk5llpkp4vkt55hp9qmci27vc.apps.googleusercontent.com&approval_prompt=force" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Login with Google
                                </a>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer text-center">
                <div class="col-lg-12" style="margin-top: -10px;">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#demo-2" data-dismiss="modal">Forgot Password?</button>
                </div>
                <div class="col-lg-12" style="margin-top: -10px;">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#registerForm" data-dismiss="modal">Create an Account!</button>
                </div>

            </div>
        </div>
    </div>
</div>
<!--        End Login Form-->


<!--Register Form-->

<div class="modal fade" id="registerForm" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title caps"><strong>Create an Account!</strong></h4>
            </div>
            <div class="modal-body col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-15">
                            <form class="user" action="${pageContext.request.contextPath}/user" method="post" id="FromRegistration">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="nameInput"
                                           placeholder="User Name" name="userName" required="" value="${requestScope.USER_TMP.username}" autocomplete="off">
                                    <p style="color: red;margin: 10px 0 0 20px;" id="nameError"></p>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="date" class="form-control form-control-user"  min="1950-04-01" id="birthday"
                                               placeholder="Birthday" name="birthday" value="${requestScope.USER_TMP.dob}" required="" autocomplete="off">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <select class="form-select" style="width: 100%; height:
                                                100%;border-radius: 40px; padding-left: 10px;border-color: #D1D3E2; color: #CCCCC9"
                                                name="gender" aria-label="Default select example" required="">
                                            <option value="1" ${requestScope.USER_TMP.sex eq true?"selected":""}>Male</option>
                                            <option value="0" ${requestScope.USER_TMP.sex eq false?"selected":""}>Female</option>
                                        </select>

                                    </div>
                                </div>                   
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="InputEmail" autocomplete="off"
                                           placeholder="Email Address" name="email" required="" value="${requestScope.USER_TMP.email}">
                                    <p style="color: red;margin: 10px 0 0 20px;" id="emailError"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="InputAddress" autocomplete="off"
                                           placeholder="Address" name="address" required="" value="${requestScope.USER_TMP.address}">
                                </div>
                                <div class="form-group">
                                    <input type="number" class="form-control form-control-user" id="InputPhoneNum" autocomplete="off"
                                           placeholder="Phone Number" name="phoneNum" required="" value="${requestScope.USER_TMP.phoneNumber}">
                                    <p style="color: red;margin: 10px 0 0 20px;" id="phoneError"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="userIDRegister" autocomplete="off"
                                           placeholder="Account" value="${requestScope.USER_TMP.userID}" name="userID" required="">
                                    <p style="color: red;margin: 10px 0 0 20px;" id="userIDError">${requestScope.ERROR_USERID}</p>
                                </div>
                                <p style="color: red; font-size: 20px;"><c:out value="${ERROR}"></c:out></p>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" autocomplete="off"
                                               id="passwordRegister" placeholder="Password" name="password" required="" value="${requestScope.USER_TMP.password}">
                                        <p style="color: red;margin: 10px 0 0 20px;" id="errorPassword"></p>
                                    </div>

                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                               id="password_repeat" placeholder="Repeat Password" name="repeatPassword" required=""value="${requestScope.USER_TMP.password}">
                                        <p style="color: red;margin: 10px 0 0 20px;" id="errorPassword"></p>
                                    </div> 
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="form-control form-control-user" id="submitRegister"
                                           name="action" value="RegisterAccount" style="background-color: #4e73df; color: white;
                                           padding:0;height: 6vh">
                                </div>
                                <hr>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/ETrans/login&response_type=code
                                   &client_id=199152751272-83nokhduk5llpkp4vkt55hp9qmci27vc.apps.googleusercontent.com&approval_prompt=force" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Login with Google
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-lg-12"></div>
                <button type="button"  style="margin-left: auto;margin-right: auto; background:none; color: gray; border: none; margin-top: -10px;" 
                        class="btn btn-primary" data-toggle="modal" data-target="#loginForm" data-dismiss="modal">Already have an account? Login!</button>
            </div>
        </div>
    </div>
</div>

<!--End Register Form-->

<!--Forgot form-->

<div class="modal fade" id="demo-2" tabindex="-1" style="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title caps"><strong>Forgot Your Password?</strong></h4>
            </div>
            <div class="modal-body col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center" style="margin-top: -10px;">
                                <p class="mb-4">We get it, stuff happens. Just enter your account address below
                                    and we'll send your new password to email!</p>
                            </div>
                            <form class="user" action="${pageContext.request.contextPath}/user">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                           id="exampleInputEmail" aria-describedby="emailHelp" autocomplete="off"
                                           placeholder="Enter Your Account ..." name="userID" required="">
                                </div>
                                <p style="color: #28fe09; font-size: 20px;">${requestScope.SUCCESS}</p>
                                <p style="color: red; font-size: 20px;">${requestScope.ERROR_FORGOT}</p>
                                <input type="submit" name="action" value="Get Password by Email" class="btn btn-primary btn-user btn-block">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="margin-top: -40px;">
                <button style="margin-left: auto;margin-right: auto;"
                        type="button" class="modal-button btn btn-info" data-toggle="modal" data-target="#loginForm" data-dismiss="modal">Try to login again!</button>
            </div>
        </div>
    </div>
</div>

<!--End Forgot form-->
<!-- Confirm email-->

<div class="modal fade comfirmEmail" id="confirmEmail" tabindex="-1" style="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title caps"><strong>Confirm Email</strong></h4>
            </div>
            <div class="modal-body col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center" style="margin-top: -10px;">
                                <p class="mb-4">Please check your email!</p>
                            </div>
                            <form class="user" action="${pageContext.request.contextPath}/user">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                           id="exampleInputEmail" aria-describedby="emailHelp" autocomplete="off"
                                           placeholder="Enter Code . . ." name="codeEmail" required="">
                                </div>
                                <p style="color: red; font-size: 20px;">${requestScope.ERROR_CODE}</p>
                                <input type="submit" name="action" value="Confirm" class="btn btn-primary btn-user btn-block">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="margin-top: -40px;">
                <button style="margin-left: auto;margin-right: auto;"
                        type="button" class="modal-button btn btn-info" data-toggle="modal" data-target="#registerForm" data-dismiss="modal">Back to Register Form!</button>
            </div>
        </div>
    </div>
</div>

<!--End confirm email-->


<!-- Active Account-->

<div class="modal fade comfirmEmail" id="activeAccount" tabindex="-1" style="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div id="activeAcc">
                <div class="modal-header">
                    <h4 class="modal-title caps"><strong>Message</strong></h4>
                </div>
                <div class="modal-body col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="p-5">
                                <div class="text-center" style="margin-top: -10px;">
                                    <h5 class="mb-4">Your account is <strong>INACTIVE</strong>!</h5>
                                    <h6>Do you want to ACTIVE account${requestScope.ACTIVE_ACCOUNT}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="changtoConfirm" class="modal-button btn btn-info" style="border: 1px solid #D1D3E2">Yes</button>
                    <button style="border: 1px solid #D1D3E2"
                            type="button" class="modal-button btn btn-info" data-toggle="modal" data-target="#registerForm" data-dismiss="modal">No</button>
                </div>
            </div>
            <div id="activeAcc2" style="display: none">
                <div class="modal-header">
                    <h4 class="modal-title caps"><strong>Confirm Email</strong></h4>
                </div>
                <div class="modal-body col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="p-5">
                                <div class="text-center" style="margin-top: -10px;">
                                    <p class="mb-4">Please check your email!</p>
                                </div>
                                <form class="user" action="${pageContext.request.contextPath}/user">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user"
                                               id="exampleInputEmail" aria-describedby="emailHelp" autocomplete="off"
                                               placeholder="Enter Code . . ." name="codeEmail" required="">
                                    </div>
                                    <p style="color: red; font-size: 20px;">${requestScope.ERROR_CODE}</p>
                                    <input type="submit" name="action" value="Confirm" class="btn btn-primary btn-user btn-block">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="margin-top: -40px;">
                    <button style="margin-left: auto;margin-right: auto;"
                            type="button" class="modal-button btn btn-info" data-toggle="modal" data-target="#registerForm" data-dismiss="modal">Back to Register Form!</button>
                </div>
            </div>

        </div>
    </div>
</div>

<!--End confirm email-->
<!--toast-->


<!--End toast-->
<script>
    function myFunction() {
        const birthday = document.getElementById('birthday').value;
        const currentYear = new Date().getFullYear();
        // alert(currentYear);
        const dateInput2 = birthday.split("-");
        // alert(dateInput2);
        const birthYear2 = dateInput2[0];

        // alert(birthYear2); 
        const birthYearCheck = Number(birthYear2);
        const age = currentYear - birthYearCheck;
        if (age < 18) {
            console.log(age);
            document.getElementById('birthday').setCustomValidity('You are not 18 years old!');
            document.getElementById('birthday').reportValidity();
        } else {
            document.getElementById('birthday').setCustomValidity('');
        }
    }
    var inputs = document.querySelectorAll('input:not([type="submit"])');

    var submit = document.getElementById('submitRegister');
    var form = document.getElementById('FromRegistration');

    submit.addEventListener('click', myFunction);
    form.addEventListener('submit', myFunction);
</script>
<script>
    document.getElementById('changtoConfirm').addEventListener('click',changeToConfirm);
    function changeToConfirm(){
        document.getElementById('activeAcc').style.display='none';
        document.getElementById('activeAcc2').style.display='block';
    }
</script>
    
   