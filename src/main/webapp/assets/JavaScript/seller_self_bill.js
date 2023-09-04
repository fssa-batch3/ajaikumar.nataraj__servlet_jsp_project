// to set the total amount
let total_value = document.getElementById("operoation");
total_value.append("₹" + total);

// to get the user's detail by comparing login email
const oneUser = JSON.parse(localStorage.getItem("logIn"));
const user_info = JSON.parse(localStorage.getItem("user_info"));
let select_user = user_info.find(function (event) {
  try {
    let customerEmail = event["Email"];
    if (user_info == customerEmail) {
      return true;
    } else if (oneUser == customerEmail) {
      return true;
    }
  } catch (error) {
    console.error(error);
  }
});

console.log(select_user);
// to get value from registration form
const phNo = document.getElementById("Phone_Number");
const userName = document.getElementById("First_name");
const Pincode = document.getElementById("pincode");
const Land_Address = document.getElementById("Land_Address");

// Compare the values
phNo.value = select_user["Phone_number"];
userName.value = select_user["FullName"];
Pincode.value = select_user["Pincode"] || "";
Land_Address.value = select_user["Land_Address"] || "";

// to replace the values
const form = document.getElementById("form");
form.addEventListener("change", function (event) {
  event.preventDefault();
  try {
    let FullName = document.getElementById("First_name").value;
    let Phone_number = document.getElementById("Phone_Number").value;
    let Pincode = document.getElementById("pincode").value;
    let Land_Address = document.getElementById("Land_Address").value;

    let newData = {
      FullName,
      Phone_number,
      Pincode,
      Land_Address,
    };
    console.log(newData);

    // assign the changed value
    const combineData = Object.assign(select_user, newData);
    console.log(combineData);
    // alert("successfully changed");

    let findIndex = user_info.indexOf(select_user);
    user_info[findIndex] = combineData;
    localStorage.setItem("user_info", JSON.stringify(user_info));
  } catch (error) {
    console.error(error);
  }
});

function account() {
  window.location.href = "/pages/13.Acct.detail.html";
}
function profile() {
  window.location.href = "/pages/profile.html";
}
