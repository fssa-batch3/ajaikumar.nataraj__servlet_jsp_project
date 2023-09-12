let id = JSON.parse(localStorage.getItem("user_info"));
console.log(id);

let login_id = JSON.parse(localStorage.getItem("logIn"));
console.log(login_id);

const get_obj = id.find((e) => e.Email === login_id);
console.log(get_obj);

const word = get_obj["FullName"];
const firstLetter = word.charAt(0);
console.log(firstLetter);

let newimage = document.getElementById("newimg");
newimage.innerText = firstLetter;

// Get current date
var today = new Date();
var currentYear = today.getFullYear();
var currentMonth = today.getMonth() + 2; // January is month 0, so we add 1

// Set minimum selectable month
var cardExpDateInput = document.getElementById("card_exp_date");
cardExpDateInput.min =
  currentYear + "-" + (currentMonth < 10 ? "0" : "") + currentMonth;

// to get details of the users for delivery ..
const oneUser = JSON.parse(localStorage.getItem("logIn"));
const user_info = JSON.parse(localStorage.getItem("user_info"));
let select_user = user_info.find(function (event) {
  // try {
  let customerEmail = event["Email"];
  if (oneUser == customerEmail) {
    return true;
  }
  // else if (oneUser == customerEmail) {
  //   return true;
  // }
  // } catch (error) {
  //   console.error(error);
  // }
});

console.log(select_user);
// to get value from registration form
const Card_no = document.getElementById("Bank_Card_no");
const holder_name = document.getElementById("holder_name");
const cvv_no = document.getElementById("cvv_no");
const exp_date = document.getElementById("card_exp_date");

// Compare the values
Card_no.value = select_user["Bank_Card_no"] || "";
holder_name.value = select_user["Account_holder_name"] || "";
cvv_no.value = select_user["CVV_No"] || "";
exp_date.value = select_user["Card_Expiry_Date"];

// to replace the values
const form = document.getElementById("form");
form.addEventListener("submit", function (event) {
  event.preventDefault();

  try {
    let Bank_Card_no = document.getElementById("Bank_Card_no").value;
    let Account_holder_name = document.getElementById("holder_name").value;
    let CVV_No = document.getElementById("cvv_no").value;
    let Card_Expiry_Date = document.getElementById("card_exp_date").value;

    let newData = {
      Bank_Card_no,
      Account_holder_name,
      CVV_No,
      Card_Expiry_Date,
    };
    console.log(newData);

    // assign the value to
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

// function bill() {
//   window.location.href = "/pages/14.product-bill.html";
// }
function profile() {
  window.location.href = "/pages/profile.html";
}
function back() {
  window.history.back();
}
function home() {
  window.location.href = "/index.html";
}
