let user_info = JSON.parse(localStorage.getItem("buyer_info"));
console.log(user_info);

let login_id = JSON.parse(localStorage.getItem("buyer_logIn"));
console.log(login_id);

const get_obj = user_info.find((e) => e.Email === login_id);
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
const oneUser = JSON.parse(localStorage.getItem("buyer_logIn"));
const buyer_info = JSON.parse(localStorage.getItem("buyer_info"));
let select_user = buyer_info.find(function (event) {
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
const Card_no = document.getElementById("Bank_Card_no");
console.log(Card_no);
const holder_name = document.getElementById("holder_name");
const cvv_no = document.getElementById("cvv_no");
const exp_date = document.getElementById("card_exp_date");

// Compare the values

Card_no.value = select_user["Bank_Card_no"] || "";
holder_name.value = select_user["Account_holder_name"] || " ";
cvv_no.value = select_user["CVV_No"] || "";
exp_date.value = select_user["Card_Expiry_Date"];

// to replace the values
const form = document.getElementById("form");
console.log(form);
form.addEventListener("submit", function (event) {
  console.log("onenhbhkjdv");

  // event.preventDefault();
  // try {
  let Bank_Card_no = document.getElementById("Bank_Card_no").value;
  console.log(Bank_Card_no);
  let Account_holder_name = document.getElementById("holder_name").value;
  // let IFSC_Code = document.getElementById("ifsc_code").value;
  let CVV_No = document.getElementById("cvv_no").value;
  let Card_Expiry_Date = document.getElementById("card_exp_date").value;

  let newData = {
    Bank_Card_no,
    Account_holder_name,
    // IFSC_Code,
    CVV_No,
    Card_Expiry_Date,
  };
  console.log(newData);

  // assign the value to
  const combineData = Object.assign(select_user, newData);
  console.log(combineData);
  // alert("successfully changed");

  let findIndex = buyer_info.indexOf(select_user);
  buyer_info[findIndex] = combineData;
  localStorage.setItem("buyer_info", JSON.stringify(buyer_info));

  window.location.href = "/pages/9.conform.html";

  // } catch (error) {
  //   console.error(error);
  // }
});

function bill() {
  window.location.href = "/pages/9.conform.html";
}
function profile() {
  window.location.href = "/pages/profile_buy.html";
}
function back() {
  window.history.back();
}
function home() {
  window.location.href = "/index.html";
}
