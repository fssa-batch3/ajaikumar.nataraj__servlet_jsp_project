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
console.log(Card);

const detail = JSON.parse(localStorage.getItem("newly_added"));

// Card creating by using JavaScript
for (let i = 0; i <= Card.length; i++) {
  let findDetail = detail.find(function (event) {
    try {
      let id = event["ProductId"];
      if (Card[i]["ProductId"] == id) {
        return true;
      }
    } catch (error) {
      console.error(error);
    }
  });
  // console.log(Card[i]["Url"]);
  let div_card = document.createElement("div");
  div_card.setAttribute("class", "card_div");
  div_card.setAttribute("type", "button");
  div_card.setAttribute("id", "div");
  // div_card.setAttribute("id", Card[i]["id"]);
  // div_card.setAttribute("onclick", "card(this.id)");

  let image = document.createElement("img");
  // console.log(Card[i]);
  image.setAttribute("src", Card[i]["Url"]);
  image.setAttribute("alt", "image");
  image.setAttribute("id", "pUrl");
  image.setAttribute("width", "100px");
  div_card.append(image);

  let fruit_name = document.createElement("input");
  fruit_name.setAttribute("value", Card[i]["Name"]);
  fruit_name.setAttribute("id", "pName");
  fruit_name.setAttribute("disabled", " ");
  div_card.append(fruit_name);

  let rupees = document.createElement("input");
  rupees.setAttribute("value", "₹ " + Card[i]["Price"] + " /kg");
  rupees.setAttribute("id", "pPrice");
  rupees.setAttribute("type", "text");
  rupees.setAttribute("disabled", " ");
  div_card.append(rupees);

  let input_value = document.createElement("input");
  input_value.setAttribute("value", "Qty: " + Card[i]["Qty"] + " kg");
  // input_value.setAttribute("type", "number");
  input_value.setAttribute("width", "10px");
  input_value.setAttribute("id", "pQty");
  input_value.setAttribute("disabled", " ");
  div_card.append(input_value);

  let edit = document.createElement("button");
  edit.setAttribute("class", "editBtn");
  // edit.innerText = "Edit";
  // edit.setAttribute("id", "submit");
  // edit.setAttribute("type", "submit");
  div_card.append(edit);

  // url params code for passing the selected product details
  let info = document.createElement("a");
  info.setAttribute("class", "editBtn");
  info.innerText = "Edit";
  info.setAttribute(
    "href",
    "/pages/new_seller_product_edit.html?ProductId=" + Card[i]["ProductId"]
  );
  edit.append(info);

  let button = document.createElement("button");
  button.innerText = "Delete";
  button.setAttribute("id", "delete");
  button.setAttribute("value", "delete");
  div_card.append(button);

  // to delete the product by clicking the delete button
  button.addEventListener("click", function (event) {
    event.preventDefault();
    try {
      let deleteData = JSON.parse(localStorage.getItem("deleted_list"));
      let findIndex = detail.indexOf(findDetail);
      let msg = confirm("Are you sure you want to delete your product");
      if (msg !== true) {
        return;
      } else {
        if (deleteData === null) {
          let array = [];
          array.push(Card[findIndex]);
          localStorage.setItem("deleted_list", JSON.stringify(array));
        } else {
          deleteData.push(Card[findIndex]);
          localStorage.setItem("deleted_list", JSON.stringify(deleteData));
        }

        detail.splice(findIndex, 1);
        localStorage.setItem("newly_added", JSON.stringify(detail));
      }
      location.reload();
    } catch (error) {
      console.error(error);
    }
  });

  document.querySelector(".card_main").append(div_card);
}

// set the edited details in the individual object
const pname = document.getElementById("pName");
const price = document.getElementById("pPrice");
const qty = document.getElementById("pQty");

pname.value = detail["Name"];
price.value = detail["Price"];
qty.value = detail["Qty"];

const div = document.getElementById("div");
div.addEventListener("submit", function (event) {
  event.preventDefault();
  try {
    let Name = document.getElementById("pName").value;
    let Price = document.getElementById("pPrice").value;
    let Qty = document.getElementById("pQty").value;

    let changeData = {
      Name,
      Price,
      Qty,
    };
  } catch (error) {
    console.error(error);
  }
});

function deleted() {
  window.location.href = "/pages/10.deleted_list.html";
}
function bill() {
  window.location.href = "/pages/12.bill.html";
}
function profile() {
  window.location.href = "/pages/profile.html";
}
