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

let searchbar = document.getElementById("searchbar");
let cards = document.getElementsByClassName("card_div");
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

// get detail from add to cart stored data
let Card = JSON.parse(localStorage.getItem("added_list"));
console.log(Card);

const detail = JSON.parse(localStorage.getItem("added_list"));

// Card creating by using JavaScript by for loop
for (let i = 0; i < Card.length; i++) {
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
  div_card.setAttribute("value", "submit");
  // div_card.setAttribute("id", Card[i]["id"]);
  // div_card.setAttribute("onclick", "card(this.id)");

  let image = document.createElement("img");
  // console.log(Card[i]);
  image.setAttribute("src", Card[i]["Url"]);
  image.setAttribute("alt", "image");
  image.setAttribute("id", "pUrl");
  image.setAttribute("width", "150px");
  div_card.append(image);

  let fruit_name = document.createElement("input");
  fruit_name.setAttribute("value", Card[i]["Name"]);
  fruit_name.setAttribute("id", "pName");
  fruit_name.setAttribute("disabled", " ");
  div_card.append(fruit_name);

  let rupees = document.createElement("input");
  rupees.setAttribute("value", Card[i]["Price"] + " /kg");
  rupees.setAttribute("id", "pPrice");
  rupees.setAttribute("type", "text");
  rupees.setAttribute("disabled", " ");
  div_card.append(rupees);

  let input_value = document.createElement("input");
  input_value.setAttribute("value", Card[i]["bQty"]);
  input_value.setAttribute("type", "number");
  input_value.setAttribute("width", "10px");
  input_value.setAttribute("id", "bQty");
  input_value.setAttribute("min", "1");
  input_value.setAttribute("oninput", "validateInput()");
  input_value.setAttribute("id", Card[i]["ProductId"]);
  div_card.append(input_value);

  let edit = document.createElement("button");
  edit.innerText = "Change qty";
  edit.setAttribute("id", "click");
  edit.setAttribute("type", "submit");
  div_card.append(edit);

  let cancel = document.createElement("button");
  cancel.innerText = "Remove";
  cancel.setAttribute("id", "submit");
  cancel.setAttribute("type", "submit");
  div_card.append(cancel);

  function validateInput() {
    var input = document.getElementById("bQty");
    var value = parseFloat(input.value);

    if (isNaN(value) || value < 1) {
      input.value = value; // Clear the input value
    }
  }

  // edit value of the card while click the "edit" button
  edit.addEventListener("click", function (event) {
    event.preventDefault();

    if (input_value.value < 1) {
      alert("Don't enter quantity below 1 kg");
      return;
    }

    try {
      // console.log();

      // to find the index of the card while click the button
      if (detail[i]["ProductId"] == Card[i]["ProductId"]) {
        const user_info = JSON.parse(localStorage.getItem("added_list"));
        let select_user = user_info.findIndex(function (event) {
          try {
            let customerEmail = event["ProductId"];
            if (user_info["ProductId"] == customerEmail) {
              console.log(user_info["product_id"]);
            }
          } catch (error) {
            console.error(error);
          }
        });

        console.log(detail);

        let qty = document.getElementById(Card[i]["ProductId"]);
        console.log(qty);

        // select_user["bQty"] = detail[i][ProductId].value;

        let qtychange = document.getElementById("div");
        console.log(qtychange);
        let bQty = document.getElementById(detail[i]["ProductId"]).value;

        let changeData = {
          bQty,
        };
        console.log(changeData);

        // assign or change the edited value
        const assignData = Object.assign(findDetail, changeData);

        // to set the changed value in the object
        let findIndex = detail.indexOf(findDetail);
        detail[findIndex] = assignData;
        localStorage.setItem("added_list", JSON.stringify(detail));
        // alert("Succesfully changed");
        document.getElementById("div");
        window.reload();
      }
    } catch (error) {
      console.error(error);
    }
    location.reload();
  });

  // to delete the product in the add to cart page
  cancel.addEventListener("click", function (event) {
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
      document.getElementById("div");
      window.reload();
    } catch (error) {
      console.error(error);
    }
    location.reload();
  });

  document.querySelector(".card_main").append(div_card);
}

function back() {
  window.history.back();
}

function order() {
  window.location.href = "/pages/7.tot-amo.html";
}
function profile() {
  window.location.href = "/pages/profile_buy.html";
}
function home() {
  window.location.href = "/index.html";
}
