// to get id of form
let buyer_logIn = document.getElementById("form");
console.log(buyer_logIn);

let arr = [];

// function for get value from form
buyer_logIn.addEventListener("submit", (event) => {
  event.preventDefault();
  try {
    // get details from local storage
    let user_data = JSON.parse(localStorage.getItem("buyer_info"));
    console.log(user_data);

    // get value from form
    let Email = document.getElementById("Email").value.toLowerCase().trim();
    let Password = document.getElementById("Password").value;

    let match = false;

    // compare the values
    for (let find of user_data) {
      if (Email == find["Email"] && Password == find["Password"]) {
        match = true;
        arr.push(find);
        window.localStorage.setItem(
          "buyer_logIn",
          JSON.stringify(arr[0]["Email"])
        );
        break;
      } else {
        match = false;
      }
    }

    // details are same move to next page
    if (match == true) {
      alert("Successfully You login to your Account");

      window.location.href = "/pages/5a-fruits.html";
    } else {
      alert("Login credentials not correct");
    }
  } catch (error) {
    console.error(error);
  }
});

function sign() {
  window.location.href = "/pages/1.buy-signin.html";
}
