// to get id of form
let logIn = document.getElementById("form");
console.log(logIn);

let arr = [];

// function for get value from form
logIn.addEventListener("submit", (event) => {
  event.preventDefault();

  // get details from local storage
  let defaultData = JSON.parse(localStorage.getItem("user_info"));
  console.log(defaultData);

  // get value from form
  let Email = document.getElementById("Email").value.toLowerCase().trim();
  let Password = document.getElementById("Password").value;

  let match = false;

  // compare the values
  for (let i = 0; i < defaultData.length; i++) {
    if (
      Email == defaultData[i]["Email"] &&
      Password == defaultData[i]["Password"]
    ) {
      match = true;
      arr.push(defaultData[i]);
      window.localStorage.setItem("logIn", JSON.stringify(arr[0]["Email"]));
      break;
    } else {
      match = false;
    }
  }

  // details are same move to next page
  if (match == true) {
    alert("You Successfully login to your account");

    window.location.href = "/pages/10.upload.html";
  } else {
    alert("Login credentials not correct");
  }
});

function sign() {
  window.location.href = "/pages/1.signin.html";
}
