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

// get current date details
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

// createw the card by for loop
for (let i = 0; i < newUploadList.length; i++) {
  let data = newUploadList[i]["newUploadProducts"];
  let total = 0;
  console.log(currentDate);
  // console.log(data[i]);

  let select_id = newUploadList.find(function (event) {
    try {
      let BillId = event["billId"];
      if (newUploadList[i]["billId"] == BillId) {
        return true;
      }
    } catch (error) {
      console.error(error);
    }
  });

  // check the stored date and current date are same
  if (currentDate >= newUploadList[i]["Pickup_date"]) {
    let form = document.createElement("form");
    form.setAttribute("class", "form");
    form.setAttribute("action", "bill");

    let bill_div = document.createElement("div");
    bill_div.setAttribute("class", "bill");
    form.append(bill_div);

    let p1 = document.createElement("img");
    p1.setAttribute("src", "../assets/image/wrong.png");
    p1.setAttribute("class", "img");
    // p1.setAttribute("width", "50px");
    // p1.setAttribute("height", "50px");
    bill_div.append(p1);

    let p2 = document.createElement("p");
    p2.innerText = "Order Id : " + newUploadList[i]["billId"];
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

    let p4 = document.createElement("a");
    p4.innerText = "Seller Id : " + newUploadList[i]["seller_id"];
    p4.setAttribute(
      "href",
      "/pages/detail_seller.html?seller_id=" + newUploadList[i]["seller_id"]
    );
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
    // console.log(data[i]["Price"]);
    // console.log(data[i]["bQty"]);

    // to delete the order for some reason
    p1.addEventListener("click", function (event) {
      event.preventDefault();
      try {
        let indexDel = newUploadList.indexOf(select_id);
        let msg = confirm("Are you sure you didn't picked up this product");
        if (msg !== true) {
          return;
        } else {
          newUploadList.splice(indexDel, 1);
          console.log(newUploadList);
          localStorage.setItem("newUploadList", JSON.stringify(newUploadList));
        }
        location.reload();
      } catch (error) {
        console.error(error);
      }
    });

    // while click order completed order store in the completed list
    p3.addEventListener("click", function (event) {
      event.preventDefault();
      try {
        let indexFind = newUploadList.indexOf(select_id);
        let Data = JSON.parse(localStorage.getItem("newUploadList"));
        let newData = JSON.parse(localStorage.getItem("owner_upload_list"));
        let owner_data = [];

        // to store the required details
        let new_data = {
          new_owner_data: Data[i]["newUploadProducts"],
          billId: Data[i]["billId"],
          seller_id: Data[i]["seller_id"],
          Pickup_date: Data[i]["Pickup_date"],
        };

        owner_data.push(new_data);

        let msg = confirm("Are you sure you Picked Up those Products");
        if (msg !== true) {
          return;
        } else {
          if (newData != null) {
            owner_data = JSON.parse(localStorage.getItem("owner_upload_list"));

            owner_data.push(new_data);

            localStorage.setItem(
              "owner_upload_list",
              JSON.stringify(owner_data)
            );
          } else {
            let owner_data = [];

            let new_data = {
              new_owner_data: Data[i]["newUploadProducts"],
              billId: Data[i]["billId"],
              seller_id: Data[i]["seller_id"],
              Pickup_date: Data[i]["Pickup_date"],
            };

            owner_data.push(new_data);

            localStorage.setItem(
              "owner_upload_list",
              JSON.stringify(owner_data)
            );
          }
        }
        // to delete the completed orders list
        newUploadList.splice(indexFind, 1);
        console.log(newUploadList);
        localStorage.setItem("newUploadList", JSON.stringify(newUploadList));
        location.reload();
      } catch (error) {
        console.error(error);
      }
    });

    document.querySelector("body").append(form);
  }
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
