// get the buyer's detail from buyer info
let Card = JSON.parse(localStorage.getItem("buyer_info"));

// sort by points which is stored in the user_info
// Card.sort((a, b) => b.points - a.points);

// code for create table
let table_card = document.createElement("table");
table_card.setAttribute("id", "leaderboard");

let th_tr1 = document.createElement("tr");
table_card.append(th_tr1);

let th1_tr = document.createElement("th");
th1_tr.innerText = "S.No";
th_tr1.append(th1_tr);

let th5_tr = document.createElement("th");
th5_tr.innerText = "ID";
th_tr1.append(th5_tr);

let th2_tr = document.createElement("th");
th2_tr.innerText = "Name";
th_tr1.append(th2_tr);

let th3_tr = document.createElement("th");
th3_tr.innerText = "Phone Number";
th_tr1.append(th3_tr);

let th4_tr = document.createElement("th");
th4_tr.innerText = "DOB";
th_tr1.append(th4_tr);

let th6_tr = document.createElement("th");
th6_tr.innerText = "Address";
th_tr1.append(th6_tr);
for (let i = 0; i < Card.length; i++) {
  let td_tr2 = document.createElement("tr");
  table_card.append(td_tr2);

  let td0_tr = document.createElement("td");
  // td0_tr.setAttribute("value", "li") || "ol";
  td0_tr.innerText = i + 1;
  td_tr2.append(td0_tr);

  let td1_tr = document.createElement("td");
  td1_tr.innerText = Card[i]["id"];
  td_tr2.append(td1_tr);

  let td2_tr = document.createElement("td");
  td2_tr.innerText = Card[i]["FullName"];
  td_tr2.append(td2_tr);

  let td3_tr = document.createElement("td");
  td3_tr.innerText = Card[i]["Phone_number"];
  td_tr2.append(td3_tr);

  let td5_tr = document.createElement("td");
  td5_tr.innerText = Card[i]["DOB"] || "";
  td_tr2.append(td5_tr);

  let td4_tr = document.createElement("td");
  td4_tr.innerText = Card[i]["Home_Address"] || "";
  td_tr2.append(td4_tr);

  document.querySelector(".table").append(table_card);
}

// let leaderboardHTML = "<ol>";

// leaderboardHTML += "</ol>";

// function for redirect the pages

function home() {
  window.location.href = "/index.html";
}
function admin() {
  window.location.href = "/pages/16.adminsignin.html";
}
function review() {
  window.location.href = "/pages/review.html";
}
function about() {
  window.location.href = "/pages/Aboutus.html";
}
function worker() {
  window.location.href = "/pages/worker_login.html";
}
function back() {
  window.history.back();
}
