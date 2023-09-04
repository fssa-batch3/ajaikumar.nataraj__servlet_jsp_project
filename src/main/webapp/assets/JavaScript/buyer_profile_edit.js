// to set the user's age more than 18
const inputDate = document.getElementById("DOB");
const today = new Date();
today.setFullYear(today.getFullYear() - 18);
const minDate = today.toISOString().split("T")[0];
inputDate.setAttribute("max", minDate);

// const countryArr = document.getElementById("countries");
// const stateArr = document.getElementById("state");
// const districtArr = document.getElementById("district");
// const countryOutput = document.getElementById("country-output");
// const stateOutput = document.getElementById("state-output");
// const cityOutput = document.getElementById("city-output");

// async function getData(endpoint) {
//   const response = await fetch(
//     `https://www.universal-tutorial.com/api/${endpoint}`,
//     {
//       method: "GET",
//       headers: {
//         Authorization:
//           "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhc2tAdW5pdmVyc2FsLXR1dG9yaWFsLmNvbSIsImFwaV90b2tlbiI6IlQ2VlBOUmZXbkxFbmdsMHd2djctZ1d2Y09KRHFPSkptc3ZoNkNOdGo5a3p1Z1RSYkhvdXVET1NXeTdzYmJzdG5taDAifSwiZXhwIjoxNjgyNjgwNzYzfQ.-_bf1xd3K9ZD_3g89PBjrYW0LVIdFeGL8DV1EpHSS4M",
//         Accept: "application/json",
//       },
//     }
//   );
//   const data = await response.json();
//   return data;
// }

// async function showData() {
//   const dataArr = await getData("countries");
//   const stateList = await getData(`states/${dataArr[0]["country_name"]}`);
//   const districtList = await getData(
//     `cities/${stateList[0]["state_name"]}`
//   );
//   let option;
//   // countryOutput.innerText = dataArr[0]["country_name"];
//   // stateOutput.innerText = stateList[0]["state_name"];
//   // cityOutput.innerText = districtList[0]["city_name"];
//   for (const element of dataArr) {
//     option = document.createElement("option");
//     console.table({
//       Country_Code: element["country_phone_code"],
//       Country_Code: element["country_short_name"],
//     });

//     option.value = element["country_name"];
//     option.text = element["country_name"];
//     countryArr.appendChild(option);
//   }
//   for (const element of stateList) {
//     option = document.createElement("option");
//     option.value = element["state_name"];
//     option.text = element["state_name"];
//     stateArr.appendChild(option);
//   }
//   for (const element of districtList) {
//     option = document.createElement("option");
//     option.value = element["city_name"];
//     option.text = element["city_name"];
//     districtArr.appendChild(option);
//   }
// }

// showData();
// countryArr.addEventListener("change", async () => {
//   const dataArr = await getData(`states/${countryArr.value}`);
//   stateArr.innerHTML = "";
//   districtArr.innerHTML = "";
//   // countryOutput.innerText = countryArr.value;
//   // stateOutput.innerText = stateArr.value;
//   // cityOutput.innerText = districtArr.value;
//   for (const element of dataArr) {
//     var option = document.createElement("option");
//     option.value = element["state_name"];
//     option.text = element["state_name"];
//     stateArr.appendChild(option);
//   }
// });
// stateArr.addEventListener("change", async () => {
//   const dataArr = await getData(`cities/${stateArr.value}`);
//   districtArr.innerHTML = "";
//   // countryOutput.innerText = countryArr.value;
//   // stateOutput.innerText = stateArr.value;
//   // cityOutput.innerText = districtArr.value;
//   for (const element of dataArr) {
//     var option = document.createElement("option");
//     option.value = element["city_name"];
//     option.text = element["city_name"];
//     districtArr.appendChild(option);
//   }
// });
// districtArr.addEventListener("change", async () => {
//   cityOutput.innerText = districtArr.value;
// });

const oneUser = JSON.parse(localStorage.getItem("buyer_logIn"));

const buyer_info = JSON.parse(localStorage.getItem("buyer_info"));
let select_user = buyer_info.find(function (event) {
  try {
    let customerEmail = event["Email"];
    if (buyer_info == customerEmail) {
      return true;
    } else if (oneUser == customerEmail) {
      return true;
    }
  } catch (error) {
    console.error(error);
  }
});

console.log(select_user);
// to get value from registration form
const email = document.getElementById("Email");
const phNo = document.getElementById("Phone_Number");
const userName = document.getElementById("First_name");
const pincode = document.getElementById("pincode");
const DOB = document.getElementById("DOB");
const transport_DOB = document.getElementById("DOB");
const Home_Address = document.getElementById("Home_Address");
const District = document.getElementById("district");
const gender = document.getElementById("gender");
const state = document.getElementById("state");
const userId = document.getElementById("userId");
const points = document.getElementById("points");
// Compare the values

email.value = select_user["Email"];
phNo.value = select_user["Phone_number"];
userName.value = select_user["FullName"];
pincode.value = select_user["Pincode"] || "";
DOB.value = select_user["DOB"];
transport_DOB.value = select_user["DOB"];
Home_Address.value = select_user["Home_Address"] || "";
District.value = select_user["District"] || "";
gender.value = select_user["gender"] || "";
state.value = select_user["state"] || "";
userId.innerText = select_user["id"];
points.innerText = select_user["points"] || 0;

// to replace the values
const form = document.getElementById("form");
form.addEventListener("submit", function (event) {
  event.preventDefault();

  try {
    let FullName = document.getElementById("First_name").value;
    // let Email = document.getElementById("Email").value;
    let Phone_number = document.getElementById("Phone_Number").value;
    let Pincode = document.getElementById("pincode").value;
    let DOB = document.getElementById("DOB").value;
    let transport_DOB = document.getElementById("DOB").value;
    let Home_Address = document.getElementById("Home_Address").value;
    let District = document.getElementById("district").value;
    let gender = document.getElementById("gender").value;
    let state = document.getElementById("state").value;

    let newData = {
      FullName,
      Phone_number,
      Pincode,
      DOB,
      transport_DOB,
      Home_Address,
      District,
      gender,
      state,
    };
    console.log(newData);

    // assign the value to

    const combineData = Object.assign(select_user, newData);
    console.log(combineData);
    alert("successfully changed");

    let findIndex = buyer_info.indexOf(select_user);
    buyer_info[findIndex] = combineData;
    localStorage.setItem("buyer_info", JSON.stringify(buyer_info));
    window.history.back();
  } catch (error) {
    console.error(error);
  }
});

// delete option in the page

let delete_user = document.getElementById("delete");
delete_user.addEventListener("click", function (event) {
  event.preventDefault();
  try {
    let indexDel = buyer_info.indexOf(select_user);
    let msg = confirm("Are you sure you want to delete your account");
    if (msg !== true) {
      return;
    } else {
      buyer_info.splice(indexDel, 1);
      console.log(buyer_info);
      localStorage.setItem("buyer_info", JSON.stringify(buyer_info));
      window.location.href = "/pages/1.signin.html";
    }
  } catch (error) {
    console.error(error);
  }
});
// logout the user
let logout_user = document.getElementById("logout");
logout_user.addEventListener("click", function (event) {
  event.preventDefault();
  try {
    let indexDel = buyer_info.indexOf(select_user);
    let msg = confirm("Are you sure you want to logout from your account");
    if (msg !== true) {
      return;
    } else {
      window.location.href = "/pages/2.Login.html";
    }
  } catch (error) {
    console.error(error);
  }
});

// to show and hide password
// const togglePassword = document.querySelector("#togglePassword");

// const change = document.querySelector("#password");

// togglePassword.addEventListener("click", () => {
//   const type = change.getAttribute("type") === "password" ? "text" : "password";

//   change.setAttribute("type", type);

//   this.classList.toggle("bi-eye");
// });

function leaderBoard() {
  window.location.href = "/pages/leaderboard_buyer.html";
}
