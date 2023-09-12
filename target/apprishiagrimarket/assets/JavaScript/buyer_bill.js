// get the values from the local storage
let Card = JSON.parse(localStorage.getItem("added_list"));

// get the user's data by comparing login email id
let buyer_info = JSON.parse(localStorage.getItem("buyer_info"));
console.log(buyer_info);

let login_id = JSON.parse(localStorage.getItem("buyer_logIn"));
console.log(login_id);

const get_obj = buyer_info.find((e) => e.Email === login_id);
console.log(get_obj);

const word = get_obj["FullName"];
const firstLetter = word.charAt(0);
console.log(firstLetter);

let newimage = document.getElementById("newimg");
newimage.innerText = firstLetter;

function profile() {
  window.location.href = "/pages/profile_buy.html";
}
function back() {
  window.history.back();
}

let total = 0;

// to create the button for place the order
let btn = document.createElement("button");
btn.innerText = "Shop More";
btn.setAttribute("id", "submit");
btn.setAttribute("class", "btn");
document.querySelector("table").append(btn);

// for creating table by add cart details..
let table_card = document.createElement("table");

let th_tr1 = document.createElement("tr");
table_card.append(th_tr1);

let th1_tr = document.createElement("th");
th1_tr.innerText = "Products Name";
th_tr1.append(th1_tr);

let th2_tr = document.createElement("th");
th2_tr.innerText = "Quantity";
th_tr1.append(th2_tr);

let th3_tr = document.createElement("th");
th3_tr.innerText = "Amount";
th_tr1.append(th3_tr);

for (let i = 0; i < Card.length; i++) {
  let td_tr2 = document.createElement("tr");
  table_card.append(td_tr2);

  let td1_tr = document.createElement("td");
  td1_tr.innerText = Card[i]["Name"];
  td_tr2.append(td1_tr);

  let td2_tr = document.createElement("td");
  td2_tr.innerText = Card[i]["bQty"] + " kg";
  td_tr2.append(td2_tr);

  let td3_tr = document.createElement("td");
  td3_tr.innerText = "Rs. " + Card[i]["Price"] * Card[i]["bQty"];
  td_tr2.append(td3_tr);

  total += parseInt(Card[i]["Price"]) * parseInt(Card[i]["bQty"]);

  // for add the points based on their buying qty
  let user_point = document.getElementById("submit");
  user_point.addEventListener("click", function (event) {
    event.preventDefault();
    try {
      // let count = 0;
      // count += 2;
      console.log(get_obj);
      let count = (get_obj.points += 1);
      console.log(get_obj);
      let user_point = get_obj["points"];
      // console.log(user_point);
      let change_value = Object.assign(count, user_point);
      console.log(change_value);
      localStorage.setItem("buyer_info", JSON.stringify(buyer_info));
    } catch (error) {
      console.log(error);
    }
  });

  document.querySelector("table").append(table_card);
}

// set delivery date
const today = new Date();
const year = today.getFullYear();
let month = today.getMonth() + 1;
let day = today.getDate();

if (day <= 28) {
  day = day + 2;
}

if (day > 28) {
  day = 33 - day;
  month = month + 1;
}

// add leading zero if month or day is a single digit
if (month < 10) {
  month = "0" + month;
}

if (day < 10) {
  day = "0" + day;
}

const currentDate = `${year}-${month}-${day}`;

console.log(currentDate);

// code for place the order and add to the another local storage for admin
document.getElementById("submit").addEventListener("click", function (event) {
  event.preventDefault();
  try {
    let Data = JSON.parse(localStorage.getItem("added_list"));
    let newData = JSON.parse(localStorage.getItem("Ordered_list"));
    let orderedData = [];
    let billId = Date.now();
    let buyer_id = get_obj["id"];
    let Delivery_date = currentDate;

    let order = {
      products: Data,
      billId: billId,
      buyer_id,
      Delivery_date,
    };

    orderedData.push(order);

    console.log(orderedData);

    // console.log(order);
    if (newData != null) {
      orderedData = JSON.parse(localStorage.getItem("Ordered_list"));

      orderedData.push(order);

      localStorage.setItem("Ordered_list", JSON.stringify(orderedData));
    } else {
      let orderedData = [];

      let order = {
        products: Data,
        billId: billId,
        buyer_id,
        Delivery_date,
      };

      orderedData.push(order);
      localStorage.setItem("Ordered_list", JSON.stringify(orderedData));
    }

    localStorage.removeItem("added_list");
    window.location.href = "/pages/5a-fruits.html";
  } catch (error) {
    console.error(error);
  }
});

// for total amount
let total_value = document.getElementById("operoation");
total_value.append("₹" + total);

// to get details of the users for delivery ..
const oneUser = JSON.parse(localStorage.getItem("buyer_logIn"));

const info = JSON.parse(localStorage.getItem("buyer_info"));
let select_user = info.find(function (event) {
  try {
    let customerEmail = event["Email"];
    if (info == customerEmail) {
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
const pincode = document.getElementById("pincode");
const phNo = document.getElementById("Phone_Number");
const userName = document.getElementById("First_name");
const Home_Address = document.getElementById("Home_Address");

// Compare the values
pincode.value = select_user["Pincode"];
phNo.value = select_user["Phone_number"];
userName.value = select_user["FullName"];
Home_Address.value = select_user["Home_Address"] || " ";

function download() {
  window.print();
}
function profile() {
  window.location.href = "/pages/profile_buy.html";
}
function home() {
  window.location.href = "/index.html";
}
