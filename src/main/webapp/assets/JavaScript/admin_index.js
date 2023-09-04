// get the mail from logined user and check in the user's list
const oneUser = JSON.parse(localStorage.getItem("admin_logIn"));

const user_info = JSON.parse(localStorage.getItem("admin_info"));
// compare and check the list
let select_user = user_info.find(function (event) {
  try {
    let customerEmail = event["Email"];
    if (oneUser == customerEmail) {
      return true;
    }
  } catch (error) {
    console.error(error);
  }
});

function customer() {
  window.location.href = "/pages/buyer.html";
}
function seller() {
  window.location.href = "/pages/seller.html";
}
function new_order() {
  window.location.href = "/pages/20-customer-order-list.html";
}
function new_upload() {
  window.location.href = "/pages/21-new-upload.html";
}
function delievered_orders() {
  window.location.href = "/pages/22-com-ord.html";
}
function picked_up_orders() {
  window.location.href = "/pages/23-picked-up-order.html";
}
function deliever_orders() {
  window.location.href = "/pages/24-inprogress-orders.html";
}
function pickup_orders() {
  window.location.href = "/pages/24-inprogress-pickup.html";
}
function home() {
  window.location.href = "/index.html";
}
function back() {
  window.history.back();
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
