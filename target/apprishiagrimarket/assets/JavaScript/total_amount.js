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

// get detail from add to cart stored data
let Card = JSON.parse(localStorage.getItem("added_list"));
let total = 0;

console.log(Card);

const detail = JSON.parse(localStorage.getItem("added_list"));

// Card creating by using JavaScript
for (let i = 0; i < Card.length; i++) {
  let findDetail = detail.find(function (event) {
    let id = event["ProductId"];
    if (Card[i]["ProductId"] == id) {
      return true;
    }
  });
  // console.log(Card[i]["Url"]);
  let div_card = document.createElement("div");
  div_card.setAttribute("class", "card_div");
  div_card.setAttribute("type", "button");
  div_card.setAttribute("id", "div");
  // div_card.setAttribute("id", Card[i]["id"]);
  // div_card.setAttribute("onclick", "card(this.id)");

  let fruit_name = document.createElement("input");
  fruit_name.setAttribute("value", Card[i]["Name"]);
  fruit_name.setAttribute("id", "pName");
  fruit_name.setAttribute("disabled", " ");
  div_card.append(fruit_name);

  let rupees = document.createElement("input");
  rupees.setAttribute("value", "Rs." + Card[i]["Price"] + " /kg");
  rupees.setAttribute("id", "pPrice");
  rupees.setAttribute("type", "text");
  rupees.setAttribute("disabled", " ");
  div_card.append(rupees);

  let input_value = document.createElement("input");
  input_value.setAttribute("value", Card[i]["bQty"] + " kg");
  // input_value.setAttribute("type", "number");
  input_value.setAttribute("width", "10px");
  input_value.setAttribute("id", "pQty");
  input_value.setAttribute("disabled", " ");
  div_card.append(input_value);

  let image = document.createElement("input");
  // console.log(Card[i]);
  image.setAttribute("value", "Rs." + Card[i]["Price"] * Card[i]["bQty"]);
  image.setAttribute("alt", "image");
  image.setAttribute("id", "pUrl");
  image.setAttribute("disabled", " ");
  div_card.append(image);

  let delete_product = document.createElement("button");
  delete_product.innerText = "Remove";
  delete_product.setAttribute("id", "submit");
  delete_product.setAttribute("type", "submit");
  div_card.append(delete_product);

  // code for delete the product
  delete_product.addEventListener("click", function (event) {
    event.preventDefault();
    try {
      let addData = JSON.parse(localStorage.getItem("added_list"));
      let findIndex = detail.indexOf(findDetail);
      let msg = confirm(
        "Are you sure you want to remove this product from your cart"
      );
      if (msg !== true) {
        return;
      } else {
        detail.splice(findIndex, 1);
        localStorage.setItem("added_list", JSON.stringify(detail));
      }
    } catch (error) {
      console.error(error);
    }
    location.reload();
  });

  // for total amount
  total += parseInt(Card[i]["Price"]) * parseInt(Card[i]["bQty"]);

  document.querySelector(".card_main").append(div_card);
}
// for get users details

function back() {
  window.history.back();
}
function home() {
  window.location.href = "/index.html";
}
