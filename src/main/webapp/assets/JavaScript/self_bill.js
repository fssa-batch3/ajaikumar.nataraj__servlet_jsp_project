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

// to get the upload details from the local storage
let Card = JSON.parse(localStorage.getItem("newly_added"));
let total = 0;

// creating table by java script
let table_card = document.createElement("table");

let th_tr1 = document.createElement("tr");
table_card.append(th_tr1);

let th1_tr = document.createElement("th");
th1_tr.innerText = "Products Name";
th_tr1.append(th1_tr);

let th2_tr = document.createElement("th");
th2_tr.innerText = "Quantity";
th_tr1.append(th2_tr);

let th4_tr = document.createElement("th");
th4_tr.innerText = "Price";
th_tr1.append(th4_tr);

let th3_tr = document.createElement("th");
th3_tr.innerText = "Total Amount";
th_tr1.append(th3_tr);

// for loop for creating the details
for (let i = 0; i < Card.length; i++) {
  let td_tr2 = document.createElement("tr");
  table_card.append(td_tr2);

  let td1_tr = document.createElement("td");
  td1_tr.innerText = Card[i]["Name"];
  td_tr2.append(td1_tr);
  console.log(Card);

  let td2_tr = document.createElement("td");
  td2_tr.innerText = Card[i]["Qty"] + " kg";
  td_tr2.append(td2_tr);

  let td4_tr = document.createElement("td");
  td4_tr.innerText = "Rs." + Card[i]["Price"];
  td_tr2.append(td4_tr);

  let td3_tr = document.createElement("td");
  td3_tr.innerText = "Rs. " + Card[i]["Price"] * Card[i]["Qty"];
  td_tr2.append(td3_tr);

  // creating the total amount by price and qty
  total += parseInt(Card[i]["Price"]) * parseInt(Card[i]["Qty"]);

  document.querySelector(".table").append(table_card);
}

function back() {
  window.history.back();
}
function home() {
  window.location.href = "/index.html";
}
