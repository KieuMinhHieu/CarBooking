const rmCheck = document.getElementById("customCheck"),
    userID = document.getElementById("userID");

if (localStorage.checkbox && localStorage.checkbox !== "") {
  rmCheck.setAttribute("checked", "checked");
  userID.value = localStorage.username;
} else {
  rmCheck.removeAttribute("checked");
  userID.value = "";
}

function lsRememberMe() {
  if (rmCheck.checked && userID.value !== "") {
    localStorage.username = userID.value;
    localStorage.checkbox = rmCheck.value;
  } else {
    localStorage.username = "";
    localStorage.checkbox = "";
  }
}