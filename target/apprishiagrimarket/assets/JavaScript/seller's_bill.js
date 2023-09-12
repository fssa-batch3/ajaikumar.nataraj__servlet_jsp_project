// to get user details

// for total amount
let total_value = document.getElementById("operoation");
total_value.append("₹" + total);

// to get details of the users for delivery ..
const oneUser = JSON.parse(localStorage.getItem("logIn"));

const info = JSON.parse(localStorage.getItem("user_info"));
let select_user = info.find(function (event) {
  // try {
  let customerEmail = event["Email"];
  if (oneUser == customerEmail) {
    return true;
  }
  // } catch (error) {
  //   console.error(error);
  // }
});

console.log(select_user);
// to get value from registration form
const Pincode = document.getElementById("pincode");
const phNo = document.getElementById("Phone_Number");
const userName = document.getElementById("First_name");
const Land_Address = document.getElementById("Land_Address");

// Compare the values

Pincode.value = select_user["Pincode"];
phNo.value = select_user["Phone_number"];
userName.value = select_user["FullName"];
Land_Address.value = select_user["Home_Address"] || "";

function profile() {
  window.location.href = "/pages/profile.html";
}
function download() {
  window.print();
}
function back() {
  window.history.back();
}
function home() {
  window.location.href = "/index.html";
}
