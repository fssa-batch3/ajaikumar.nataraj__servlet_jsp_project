// to get login details from form
let worker_login = document.getElementById("form");
console.log(worker_login);

let arr = [];

// get and compare the value while click the button
worker_login.addEventListener("submit", (event) => {
  event.preventDefault();
  try {
    let defaultData = JSON.parse(localStorage.getItem("worker_info"));
    console.log(defaultData);

    let Email = document.getElementById("Email").value.toLowerCase().trim();
    let Password = document.getElementById("Password").value;

    let match = false;

    for (let i = 0; i < defaultData.length; i++) {
      if (
        Email == defaultData[i]["Email"] &&
        Password == defaultData[i]["Password"]
      ) {
        match = true;
        arr.push(defaultData[i]);
        window.localStorage.setItem(
          "worker_login",
          JSON.stringify(arr[0]["Email"])
        );
        break;
        // i = i + defaultData.length;
      } else {
        match = false;
      }
    }

    // msg for inputs are correct  are not
    if (match == true) {
      alert("You Successfully login to your account");

      window.location.href = "/pages/worker_home.html";
    } else {
      alert("Login credentials not correct");
    }
  } catch (error) {
    console.error(error);
  }
});

function sign() {
  window.location.href = "/pages/worker_signup.html";
}
