// create an array and get the detail from form
let signUpform = document.getElementById("form");
document.createElement("admin_info");

// code for the process while click the sign up button
signUpform.addEventListener("submit", function (event) {
  event.preventDefault();
  try {
    let array = [];
    if (localStorage.getItem("admin_info") != null) {
      array = JSON.parse(localStorage.getItem("admin_info"));
    }

    let match = false;

    // to get the value from form by their ID
    const admin_id = Date.now();
    const FullName = document.getElementById("full_name").value;
    const Email = document.getElementById("email").value.toLowerCase();
    const Phone_number = document.getElementById("phone_number").value;
    const Password = document.getElementById("password").value;
    const Confirm_Password = document.getElementById("conform_password").value;

    // code for check password and confirm password are same or not
    if (Password != Confirm_Password) {
      alert("Password and Confirm password are not match");
      return false;
    } else {
      for (let user_arr of array) {
        if (Email == user_arr["Email"]) {
          match = true;
        }
      }
    }

    // code for create the user details in an array by object
    if (match == true) {
      alert("Email is already Exist");
      return false;
    } else {
      let userObj = {
        FullName,
        admin_id,
        Email,
        Phone_number,
        Password,
        Confirm_Password,
      };
      console.log(userObj);

      array.push(userObj);
      const str = JSON.stringify(array);
      localStorage.setItem("admin_info", str);
      console.log(str);
      window.location.href = "/pages/16.admin.login.html";
    }
  } catch (error) {
    console.error(error);
  }
});

function log() {
  window.location.href = "/pages/16.admin.login.html";
}

// for create  user id
const start = Date.now();

// to show and hide password
const togglePassword = document.querySelector("#togglePassword");

const password = document.querySelector("#password");

togglePassword.addEventListener("click", () => {
  const type =
    password.getAttribute("type") === "password" ? "text" : "password";

  password.setAttribute("type", type);

  this.classList.toggle("bi-eye");
});

// to show and hide confirm password
const toggleConformPassword = document.querySelector("#toggleConformPassword");

const conform_password = document.querySelector("#conform_password");

toggleConformPassword.addEventListener("click", () => {
  const type =
    conform_password.getAttribute("type") === "password" ? "text" : "password";

  conform_password.setAttribute("type", type);

  this.classList.toggle("bi-eye");
});
