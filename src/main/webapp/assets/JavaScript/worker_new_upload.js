// get the details from localstorage
let newUploadList = JSON.parse(localStorage.getItem("newUploadList"));

// get the searching name by id and classname
let searchbar = document.getElementById("searchbar");
let cards = document.getElementsByClassName("form");

// compare the values from search bar and name from each card
searchbar.addEventListener("input", () => {
  for (let i = 0; i < cards.length; i++) {
    const element = cards[i];
    if (
      element.innerHTML.toLowerCase().includes(searchbar.value.toLowerCase())
    ) {
      element.style.display = "block";
    } else {
      element.style.display = "none";
    }
  }
});

// create the card by details from localstorage
for (let i = 0; i < newUploadList.length; i++) {
  let data = newUploadList[i]["newUploadProducts"];
  let total = 0;

  // let select_id = newUploadList.find(function (event) {
  //   let BillId = event["billId"];
  //   if (newUploadList[i]["billId"] == BillId) {
  //     return true;
  //   }
  // });

  let form = document.createElement("form");
  form.setAttribute("class", "form");
  form.setAttribute("action", "bill");

  let bill_div = document.createElement("div");
  bill_div.setAttribute("class", "bill");
  form.append(bill_div);

  // let p1 = document.createElement("img");
  // p1.setAttribute("src", "../assets/image/wrong.png");
  // p1.setAttribute("class", "img");
  // bill_div.append(p1);

  let p2 = document.createElement("p");
  p2.innerText = "Order Id : " + newUploadList[i]["billId"];
  bill_div.append(p2);

  // let p3 = document.createElement("img");
  // p3.setAttribute("src", "../assets/image/tick_green.jpg");
  // p3.setAttribute("class", "img");
  // bill_div.append(p3);

  let buy_div = document.createElement("div");
  buy_div.setAttribute("class", "buy");
  form.append(buy_div);

  let p4 = document.createElement("p");
  p4.innerText = "Seller Id : " + newUploadList[i]["seller_id"];
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

    // total of all values
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
  p6.innerText = "Pickup Date : " + newUploadList[i]["Pickup_date"];
  date_div.append(p6);

  document.querySelector("body").append(form);
}

function store() {
  window.location.href = "/pages/19a-store.html";
}
function back() {
  window.history.back();
}
function home() {
  window.location.href = "/index.html";
}

let buyer_info = JSON.parse(localStorage.getItem("admin_info"));
// console.log(buyer_info);

let login_id = JSON.parse(localStorage.getItem("admin_logIn"));
// console.log(login_id);

const get_obj = buyer_info.find((e) => e.Email === login_id);
// console.log(get_obj);

const word = get_obj["FullName"];
const firstLetter = word.charAt(0);
console.log(firstLetter);

let newimage = document.getElementById("newimg");
newimage.innerText = firstLetter;
