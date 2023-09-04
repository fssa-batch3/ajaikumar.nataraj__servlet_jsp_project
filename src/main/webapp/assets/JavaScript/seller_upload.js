function submit() {
  window.location.href = "/pages/11.place-products.html";
}
function history() {
  window.location.href = "/pages/10.a.history.html";
}
function home() {
  window.location.href = "/index.html";
}

// compare the user's detail from the login email to get details of uploader
uploadForm = document.getElementById("form");
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

document.createElement("newly_added");

// to get details of the products from the form by id and store in the new array
uploadForm.addEventListener("submit", function (event) {
  event.preventDefault();
  try {
    let array = [];
    if (localStorage.getItem("newly_added") != null) {
      array = JSON.parse(localStorage.getItem("newly_added"));
    }

    // let match = false;

    // to set the details by object in an array
    const Url = document.getElementById("url").value;
    const Name = document.getElementById("product").value;
    const Type = document.getElementById("type").value;
    const Price = document.getElementById("price").value;
    const Qty = document.getElementById("qty").value;
    const bQty = document.getElementById("qty").value;
    const City = document.getElementById("city").value;
    const District = document.getElementById("District").value;
    const Description = document.getElementById("description").value;
    let ProductId = Date.now();
    let userId = get_obj["id"];
    // let date = get_obj["transport_DOB"];

    let inputDetails = {
      Url,
      Name,
      Type,
      Price,
      Qty,
      bQty,
      City,
      District,
      Description,
      ProductId,
      userId,
      // date,
    };
    // console.log(Product_id);

    array.push(inputDetails);
    const str = JSON.stringify(array);
    localStorage.setItem("newly_added", str);
    console.log(str);
    document.getElementById("form").reset();
  } catch (error) {
    console.error(error);
  }
});

function profile() {
  window.location.href = "/pages/profile.html";
}
function back() {
  window.history.back();
}
// const start = Date.now();
