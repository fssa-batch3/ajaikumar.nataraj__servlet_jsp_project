// to get details of logined user by compare
const oneUser = JSON.parse(localStorage.getItem("worker_login"));

const user_info = JSON.parse(localStorage.getItem("worker_info"));
let select_user = user_info.find(function (event) {
  try {
    let customerEmail = event["Email"];
    if (user_info == customerEmail) {
      return true;
    } else if (oneUser == customerEmail) {
      return true;
    }
  } catch (error) {
    console.error(error);
  }
});

// set user name in the name box
const name = document.getElementById("profile");

name.value = select_user["FullName"];

function new_order() {
  window.location.href = "/pages/worker_new_order.html";
}
function new_upload() {
  window.location.href = "/pages/worker_new_upload.html";
}
function deliver_order_inprogress() {
  window.location.href = "/pages/worker_order_inprogress.html";
}
function pickup_order_inprogress() {
  window.location.href = "/pages/worker_pickup_inprogress.html";
}
function customer() {
  window.location.href = "/pages/buyer.html";
}
function seller() {
  window.location.href = "/pages/seller.html";
}
function back() {
  window.history.back();
}
function home() {
  window.location.href = "/index.html";
}
