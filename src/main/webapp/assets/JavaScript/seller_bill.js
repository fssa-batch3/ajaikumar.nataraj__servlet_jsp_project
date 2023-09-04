// get the values from the local storage
let Card = JSON.parse(localStorage.getItem("newly_added"));

// get the user's data by comparing login email id
let user_info = JSON.parse(localStorage.getItem("user_info"));
console.log(user_info);

let login_id = JSON.parse(localStorage.getItem("logIn"));
console.log(login_id);

const get_obj = user_info.find((e) => e.Email === login_id);
console.log(get_obj);

const word = get_obj["FullName"];
const firstLetter = word.charAt(0);
console.log(firstLetter);

let newimage = document.getElementById("newimg");
newimage.innerText = firstLetter;

let total = 0;

// to create the button for place the order
let btn = document.createElement("button");
btn.innerText = "Sell More";
btn.setAttribute("id", "submit");
btn.setAttribute("class", "btn");
document.querySelector(".table").append(btn);

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
  td2_tr.innerText = Card[i]["Qty"] + " kg";
  td_tr2.append(td2_tr);

  let td3_tr = document.createElement("td");
  td3_tr.innerText = "Rs. " + Card[i]["Price"] * Card[i]["Qty"];
  td_tr2.append(td3_tr);

  total += parseInt(Card[i]["Price"]) * parseInt(Card[i]["Qty"]);

  // for add the points based on their selling qty
  let user_point = document.getElementById("submit");
  user_point.addEventListener("click", function (event) {
    event.preventDefault();

    try {
      console.log(get_obj);
      let count = (get_obj.points += 1);
      console.log(get_obj);
      let user_point = get_obj["points"];
      let change_value = Object.assign(count, user_point);
      console.log(change_value);
      localStorage.setItem("user_info", JSON.stringify(user_info));
    } catch (error) {
      console.error(error);
    }
  });

  document.querySelector(".table").append(table_card);
}

// set pickup date
const today = new Date();
const year = today.getFullYear();
let month = today.getMonth() + 1;
let day = today.getDate();

if (day <= 28) {
  day = day + 2;
}

if (day > 28) {
  day = 30 - 28;
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
    let Data = JSON.parse(localStorage.getItem("newly_added"));
    let exists = JSON.parse(localStorage.getItem("newUploadList"));
    let orderedData = [];
    let billId = Date.now();
    let seller_id = get_obj["id"];
    let Pickup_date = currentDate;

    let order = {
      newUploadProducts: Data,
      billId: billId,
      seller_id,
      Pickup_date,
    };

    // push the data from user's to admin
    orderedData.push(order);

    console.log(orderedData);

    // console.log(order);
    if (exists != null) {
      orderedData = JSON.parse(localStorage.getItem("newUploadList"));

      orderedData.push(order);

      localStorage.setItem("newUploadList", JSON.stringify(orderedData));
    } else {
      let orderedData = [];

      let order = {
        newUploadProducts: Data,
        billId: billId,
        seller_id,
        Pickup_date,
      };

      orderedData.push(order);
      localStorage.setItem("newUploadList", JSON.stringify(orderedData));
    }

    // remove the details from user's storage
    localStorage.removeItem("newly_added");
    window.location.href = "/pages/10.upload.html";
  } catch (error) {
    console.error(error);
  }
});
