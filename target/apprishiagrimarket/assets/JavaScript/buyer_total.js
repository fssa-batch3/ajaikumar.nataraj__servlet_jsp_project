// set place for show total amount
let total_value = document.getElementById("operoation");
total_value.append("₹" + total);

// to get details of the users for delivery ..
const oneUser = JSON.parse(localStorage.getItem("buyer_logIn"));

const user_info = JSON.parse(localStorage.getItem("buyer_info"));
let select_user = user_info.find(function (event) {
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
// to get value from delivery form
const phNo = document.getElementById("Phone_Number");
const userName = document.getElementById("First_name");
const Home_Address = document.getElementById("Home_Address");
const Pincode = document.getElementById("pincode");

// Compare the values

phNo.value = select_user["Phone_number"];
userName.value = select_user["FullName"];
Home_Address.value = select_user["Home_Address"] || " ";
Pincode.value = select_user["Pincode"] || " ";

// to replace the values
const form = document.getElementById("form");
form.addEventListener("change", function (event) {
  event.preventDefault();
  try {
    let FullName = document.getElementById("First_name").value;
    let Phone_number = document.getElementById("Phone_Number").value;
    let Home_Address = document.getElementById("Home_Address").value;
    let Pincode = document.getElementById("Pincode").value;

    let newData = {
      FullName,
      Phone_number,
      Home_Address,
      Pincode,
    };
    console.log(newData);

    // code for change the delivery address
    const combineData = Object.assign(select_user, newData);
    console.log(combineData);

    let findIndex = user_info.indexOf(select_user);
    user_info[findIndex] = combineData;
    localStorage.setItem("buyer_info", JSON.stringify(user_info));
  } catch (error) {
    console.error(error);
  }
});

function order() {
  window.location.href = "/pages/8.payment-page.html";
}

function back() {
  window.location.href = "/pages/6.buy-2.html";
}
function profile() {
  window.location.href = "/pages/profile_buy.html";
}
