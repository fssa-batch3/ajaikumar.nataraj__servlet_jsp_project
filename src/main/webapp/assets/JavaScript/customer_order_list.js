// to get the details from ordered list
let Ordered_list = JSON.parse(localStorage.getItem("Ordered_list"));

// date format for set date
const today = new Date();
const year = today.getFullYear();
let month = today.getMonth() + 1;
let day = today.getDate();

// add leading zero if month or day is a single digit
if (month < 10) {
  month = "0" + month;
}

if (day < 10) {
  day = "0" + day;
}

const currentDate = `${year}-${month}-${day}`;

console.log(currentDate);

// for creating ordered list by for loop
for (let i = 0; i <= Ordered_list.length; i++) {
  let data = Ordered_list[i]["products"];
  let total = 0;

  let select_id = Ordered_list.find(function (event) {
    try {
      let BillId = event["billId"];
      if (Ordered_list[i]["billId"] == BillId) {
        return true;
      }
    } catch (error) {
      console.error(error);
    }
  });
  console.log(currentDate);
  // console.log(data[i]["Pickup_date"]);

  // create the card list
  let form = document.createElement("form");
  form.setAttribute("class", "form");
  form.setAttribute("action", "bill");

  let bill_div = document.createElement("div");
  bill_div.setAttribute("class", "bill");
  form.append(bill_div);

  let p1 = document.createElement("img");
  p1.setAttribute("src", "../assets/image/wrong.png");
  p1.setAttribute("class", "img");
  p1.setAttribute("id", "delete");
  // p1.setAttribute("width", "50px");
  // p1.setAttribute("height", "50px");
  bill_div.append(p1);

  let p2 = document.createElement("p");
  p2.innerText = "Order Id : " + Ordered_list[i]["billId"];
  bill_div.append(p2);

  let p3 = document.createElement("img");
  p3.setAttribute("src", "../assets/image/tick_green.jpg");
  p3.setAttribute("class", "img");
  // p3.setAttribute("width", "50px");
  // p3.setAttribute("height", "50px");
  bill_div.append(p3);

  let buy_div = document.createElement("div");
  buy_div.setAttribute("class", "buy");
  form.append(buy_div);

  let p4 = document.createElement("p");
  p4.innerText = "Buyer Id : " + Ordered_list[i]["buyer_id"];
  buy_div.append(p4);

  let ful_div = document.createElement("div");
  ful_div.setAttribute("class", "ful");
  form.append(ful_div);

  for (let j = 0; j < data.length; j++) {
    let ul_div = document.createElement("div");
    ul_div.setAttribute("class", "ul");
    ful_div.append(ul_div);

    let ul1 = document.createElement("ul");
    ul1.innerText = "Name : " + data[j]["Name"];
    ul_div.append(ul1);

    let ul2 = document.createElement("ul");
    ul2.innerText = "Qty   : " + data[j]["bQty"] + " kg";
    ul_div.append(ul2);

    let ul3 = document.createElement("ul");
    ul3.innerText = "Rs." + data[j]["Price"] + " / kg";
    ul_div.append(ul3);

    let ul4 = document.createElement("ul");
    ul4.innerHTML = "Total Amount : " + data[j]["Price"] * data[j]["bQty"];
    ul_div.append(ul4);

    // get the total of all products
    total += parseInt(data[j]["Price"]) * parseInt(data[j]["bQty"]);
  }

  let date_div = document.createElement("div");
  date_div.setAttribute("class", "date");

  form.append(date_div);

  let p5 = document.createElement("p");
  p5.setAttribute("id", "operation");
  p5.innerHTML = " Total Amount : ₹" + total;
  date_div.append(p5);

  let p6 = document.createElement("p");
  p6.innerText = "Delivery Date : " + Ordered_list[i]["Pickup_date"];
  date_div.append(p6);
  // console.log(data[i]["Price"]);
  // console.log(data[i]["bQty"]);

  document.querySelector("body").append(form);
}

function store() {
  window.location.href = "/pages/19a-store.html";
}
