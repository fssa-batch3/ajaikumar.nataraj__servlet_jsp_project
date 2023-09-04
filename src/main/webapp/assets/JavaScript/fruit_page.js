// get the object from local storage
let Card = JSON.parse(localStorage.getItem("owner_upload_list"));
// get the searching name by id and classname
let searchbar = document.getElementById("searchbar");
let cards = document.getElementsByClassName("aTag");

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

// for types bar........

// let bar = document.createElement("nav");

// let fruit = document.createElement("button");
// fruit.innerText = "Fruits";
// fruit.setAttribute("class", "same");
// fruit.setAttribute("onclick", "fruits()");
// bar.append(fruit);

// let vegetable = document.createElement("button");
// vegetable.innerText = "Vegetables";
// vegetable.setAttribute("onclick", "vegetables()");
// bar.append(vegetable);

// let grains = document.createElement("button");
// grains.innerText = "Cereals & Grains";
// grains.setAttribute("onclick", "pulses()");
// bar.append(grains);

// let tea = document.createElement("button");
// tea.innerText = "Tea & Coffee";
// tea.setAttribute("onclick", "coffee()");
// bar.append(tea);

// document.querySelector(".button").append(bar);

// get the product details from localstorage
const detail = JSON.parse(localStorage.getItem("owner_upload_list"));

// Card creating by using JavaScript
for (let i = 0; i < Card.length; i++) {
  let Data = Card[i]["new_owner_data"];
  console.log(Data);

  for (let j = 0; j < Data.length; j++) {
    console.log(j);

    let info = document.createElement("a");
    info.setAttribute("class", "aTag");
    info.setAttribute(
      "href",
      "./new_detail.html?ProductId=" + Data[j]["ProductId"]
    );

    let div_card = document.createElement("div");
    // div_card.setAttribute("class", "card_div" + " " + Data[j]["Type"]);
    div_card.setAttribute("type", "button");
    div_card.setAttribute("id", "form");
    info.append(div_card);

    let image = document.createElement("img");
    image.setAttribute("src", Data[j]["Url"]);
    image.setAttribute("alt", "image");
    image.setAttribute("id", "pUrl");
    image.setAttribute("width", "150px");
    info.append(image);

    let fruit_name = document.createElement("p");
    fruit_name.innerText = Data[j]["Name"];
    fruit_name.setAttribute("id", "pName");
    fruit_name.setAttribute("disabled", " ");
    info.append(fruit_name);
    // console.log(fruit_name);

    let rupees = document.createElement("p");
    rupees.innerText = "Price :" + " ₹ " + Data[j]["Price"] + " /kg";
    rupees.setAttribute("id", "productPrice");
    rupees.setAttribute("class", "price");
    rupees.setAttribute("type", "text");
    rupees.setAttribute("disabled", "");
    info.append(rupees);

    let offer = document.createElement("p");
    offer.setAttribute("value", `$("discountPercentage")`);
    offer.setAttribute("id", "Offer");
    offer.setAttribute("class", "price");
    offer.setAttribute("type", "text");
    offer.setAttribute("disabled", "");
    info.append(offer);
    console.log(offer);

    let discountPrice = document.createElement("p");
    discountPrice.innerText =
      "Price :" + " ₹ " + Data[j]["DiscountPrice"] + " /kg" || 0;
    discountPrice.setAttribute("id", "discountPrice");
    discountPrice.setAttribute("type", "text");
    discountPrice.setAttribute("disabled", "");
    info.append(discountPrice);

    let Type = document.createElement("p");
    Type.innerText = "Type :" + Data[j]["Type"];
    Type.setAttribute("id", "Type");
    info.setAttribute("Type", Data[j]["Type"]);
    Type.setAttribute("disabled", "");
    info.append(Type);

    let district = document.createElement("p");
    district.innerText = Data[j]["District"];
    district.setAttribute("id", "district");
    district.setAttribute("type", "text");
    district.setAttribute("disabled", "");
    info.append(district);

    let state = document.createElement("p");
    state.innerText = Data[j]["State"];
    state.setAttribute("id", "state");
    state.setAttribute("type", "text");
    state.setAttribute("disabled", "");
    info.append(state);

    // code for compare the types from local storage, if types are same show in the page
    // if (Data[j]["Type"] == "Fruit") {
    //   let div_card = document.createElement("div");
    //   div_card.setAttribute("class", "card_div");
    //   div_card.setAttribute("type", "button");
    //   div_card.setAttribute("id", "form");

    //   let image = document.createElement("img");
    //   image.setAttribute("src", Data[j]["Url"]);
    //   image.setAttribute("alt", "image");
    //   image.setAttribute("id", "pUrl");
    //   div_card.append(image);

    //   let fruit_name = document.createElement("input");
    //   fruit_name.setAttribute("value", Data[j]["Name"]);
    //   fruit_name.setAttribute("id", "pName");
    //   fruit_name.setAttribute("disabled", " ");
    //   div_card.append(fruit_name);

    //   let rupees = document.createElement("input");
    //   rupees.setAttribute("value", " ₹ " + Data[j]["Price"] + " /kg");
    //   rupees.setAttribute("id", "pPrice");
    //   rupees.setAttribute("type", "text");
    //   rupees.setAttribute("disabled", "");
    //   div_card.append(rupees);

    //   let button = document.createElement("button");
    //   button.innerText = "Add Cart";
    //   button.setAttribute("id", "submit");
    //   button.setAttribute("value", "submit");
    //   button.setAttribute("id", Data[j]["ProductId"]);
    //   button.setAttribute("onclick", "addProduct(this.id)");
    //   div_card.append(button);

    // code for add the selected items to add cart page
    function addProduct(ProductId) {
      event.preventDefault();
      console.log(ProductId);

      try {
        let addData = JSON.parse(localStorage.getItem("added_list"));
        console.log(addData);

        console.log(Card);

        let currentProduct;

        for (let i = 0; i < Card.length; i++) {
          for (let j = 0; j < Card[i]["new_owner_data"].length; j++) {
            if (Card[i]["new_owner_data"][j]["ProductId"] == ProductId) {
              currentProduct = Card[i]["new_owner_data"][j];
            }
          }
        }

        console.log(currentProduct);

        //  code for set the automatic qty for user as 1kg and it stores in local storage
        let arr = [];
        console.log(arr);
        currentProduct["bQty"] = "1";
        arr.push(currentProduct["bQty"]);

        // msg for confirm to add to cart
        let msg = confirm(
          "Are you sure you want to add this product to your cart"
        );
        if (msg !== true) {
          return;
        } else {
          if (addData === null) {
            let array = [];
            array.push(currentProduct);
            localStorage.setItem("added_list", JSON.stringify(array));
          } else {
            addData.push(currentProduct);
            localStorage.setItem("added_list", JSON.stringify(addData));
          }
        }
      } catch (error) {
        console.error(error);
      }
    }
    // url params code for passing the selected product details
    // let info = document.createElement("a");
    // info.innerText = "more info -->";
    // info.setAttribute("href", "./detail.html?Name=" + Data[j]["Name"]);
    // div_card.append(info);

    document.querySelector(".card_main").append(info);

    // document.querySelector(".card_main").append(div_card);
  }
}
// }

// code for redirection of page
function cart() {
  window.location.href = "/pages/6.buy-2.html";
}
function back() {
  window.location.href = "/pages/4.index.html";
}
function vegetables() {
  window.location.href = "/pages/5b-vegetables.html";
}
function coffee() {
  window.location.href = "/pages/5c-tea.html";
}
function pulses() {
  window.location.href = "/pages/5d-grain.html";
}
function profile() {
  window.location.href = "/pages/profile_buy.html";
}
