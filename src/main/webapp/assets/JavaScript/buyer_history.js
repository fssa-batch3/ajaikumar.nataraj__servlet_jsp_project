// get logined user's details
let id = JSON.parse(localStorage.getItem("buyer_info"));
console.log(id);

let login_id = JSON.parse(localStorage.getItem("buyer_logIn"));
console.log(login_id);

const get_obj = id.find((e) => e.Email === login_id);
console.log(get_obj);

const word = get_obj["FullName"];
const firstLetter = word.charAt(0);
console.log(firstLetter);

let newimage = document.getElementById("newimg");
newimage.innerText = firstLetter;

// get details from localstorage
let Card = JSON.parse(localStorage.getItem("owner_order_list"));

for (let i = 0; i < Card.length; i++) {
  if (Card[i]["buyer_id"] == get_obj["id"]) {
    let data = Card[i]["new_owner_data"];
    let total = 0;

    let form = document.createElement("form");
    form.setAttribute("class", "form");
    form.setAttribute("action", "bill");

    let bill_div = document.createElement("div");
    bill_div.setAttribute("class", "bill");
    form.append(bill_div);

    // let p1 = document.createElement("img");
    // p1.setAttribute("src", "../assets/image/wrong.png");
    // p1.setAttribute("class", "img");
    // // p1.setAttribute("width", "50px");
    // // p1.setAttribute("height", "50px");
    // bill_div.append(p1);

    let p2 = document.createElement("p");
    p2.innerText = "Ordered Id : " + Card[i]["billId"];
    bill_div.append(p2);

    // let p3 = document.createElement("img");
    // p3.setAttribute("src", "../assets/image/tick_green.jpg");
    // p3.setAttribute("class", "img");
    // // p3.setAttribute("width", "50px");
    // // p3.setAttribute("height", "50px");
    // bill_div.append(p3);

    let buy_div = document.createElement("div");
    buy_div.setAttribute("class", "buy");
    form.append(buy_div);

    // let p4 = document.createElement("p");
    // p4.innerText = "Buyer Id : " + Card[i]["seller_id"];
    // buy_div.append(p4);

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

      // get price total
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
    p6.innerText = "Delivered Date : " + Card[i]["Delivery_date"];
    date_div.append(p6);
    // console.log(data[i]["Price"]);
    // console.log(data[i]["bQty"]);

    document.querySelector("body").append(form);
  }
}

// function store() {
//   window.location.href = "/pages/19a-store.html";
// }
function back() {
  window.history.back();
}
function profile() {
  window.location.href = "/pages/profile_buy.html";
}
