// for (let i = 0; i <= Card.length; i++) {
//   let div_card = document.createElement("div");
//   div_card.setAttribute("class", "card");

//   let card = document.createElement("div");
//   card.setAttribute("class", "img");
//   div_card.append(card);

//   let image = document.createElement("img");
//   image.setAttribute("src", Card[i]["Image"]);
//   image.setAttribute("alt", Card[i]["alt"]);
//   image.setAttribute("width", Card[i]["width"] + "px");
//   card.append(image);

//   let detail = document.createElement("div");
//   detail.setAttribute("class", "detail");
//   div_card.append(detail);

//   let name = document.createElement("p");
//   name.innerText = "Name :" + Card[i]["Name"];
//   detail.append(name);

//   let price = document.createElement("p");
//   price.innerText = "Price :" + Card[i]["Price"] + "/kg";
//   detail.append(price);

//   let type = document.createElement("p");
//   type.innerText = "Type :" + Card[i]["Type"];
//   detail.append(type);

//   let place = document.createElement("p");
//   place.innerText = "Place :" + Card[i]["Place"];
//   detail.append(place);

//   let description = document.createElement("p");
//   description.innerText = "Description :" + Card[i]["Description"];
//   detail.append(description);

//   let input_value = document.createElement("input");
//   input_value.setAttribute("Qty" + "type", "number");
//   input_value.setAttribute("id", "quantity");
//   detail.append(input_value);

//   document.querySelector("body").append(div_card);

//   let footer = document.createElement("footer");
//   footer.setAttribute("class", "footer");

//   let buy_btn = document.createElement("button");
//   buy_btn.innerText = "BUY NOW";
//   footer.append(buy_btn);

//   let cart_btn = document.createElement("button");
//   cart_btn.innerText = "ADD CART";
//   footer.append(cart_btn);

//   document.querySelector("body").append(footer);
// }

// function to send comment and to set in the local storage
function send() {
  try {
    const msginput = document.getElementById("msg").value;
    const coverpic = user_id["user_pic"];
    const hours = new Date().getHours();
    const minutes = new Date().getMinutes();
    const currentTime = `${hours}:${minutes}`;

    const Userid = user_id["userid"];

    const username = user_id["user_name"];

    const fundraiseid = fundraiseDetails["product_id"];

    const commentid = Date.now();

    if (msginput == "" || msginput == null) {
      alert("You can't send empty comment");
      return;
    } else {
      let commentObj = {
        userpic: coverpic,
        userName: username,
        user_ID: Userid,
        fundraiseId: fundraiseid,
        commentId: commentid,
        time: currentTime,
        msg: msginput,
      };
      console.log(commentObj);
      commentArr.push(commentObj);
      window.localStorage.setItem("commentmain", JSON.stringify(commentArr));
    }
    location.reload();
  } catch (error) {
    console.error(error);
  }
}

// not to get value replace in the comment main array in the local storage
if (localStorage.getItem("commentmain") !== null) {
  commentArr = JSON.parse(window.localStorage.getItem("commentmain"));
}
console.log(commentArr);

let commentNewarr = [];
let commentnewob = {};

// to show the appropriate fundraise card comment
// loop to assignit to a new object then push it into the new array and store it in a localstorage
for (let i = 0; i < commentArr.length; i++) {
  if (getIDdetails == commentArr[i]["fundraiseId"]) {
    commentNewarr.push(commentArr[i]);
  }
}
console.log(commentNewarr);
window.localStorage.setItem("comment", JSON.stringify(commentNewarr));

let comment = JSON.parse(window.localStorage.getItem("comment"));
console.log(comment);

// to read the comment by the donater

for (let i = 0; i < comment.length; i++) {
  console.log(comment[i]["user_ID"]);
  console.log(user_id["userid"]);
  if (comment[i]["user_ID"] == user_id["userid"]) {
    let commentMsg = document.createElement("div");
    commentMsg.setAttribute("class", "chat-message");

    let userImg;
    userImg = document.createElement("img");
    userImg.setAttribute("src", comment[i]["userpic"]);
    userImg.setAttribute("alt", "profile");
    userImg.setAttribute("width", "32");
    userImg.setAttribute("height", "32");
    userImg.setAttribute("style", "border-radius: 50%");
    commentMsg.append(userImg);

    let msgcontent;
    msgcontent = document.createElement("div");
    msgcontent.setAttribute("class", "chat-message-content");
    commentMsg.append(msgcontent);

    let spanTime;
    spanTime = document.createElement("div");
    spanTime.setAttribute("class", "chat-time");
    spanTime.innerText = comment[i]["time"];
    msgcontent.append(spanTime);

    let heading_user;
    heading_user = document.createElement("h5");
    heading_user.innerText = comment[i]["userName"];
    msgcontent.append(heading_user);

    let msg;
    msg = document.createElement("p");
    msg.setAttribute("style", "color: black");
    msg.innerText = comment[i]["msg"];
    msg.setAttribute("id", "msg_content");
    msgcontent.append(msg);

    let editDeldiv;
    editDeldiv = document.createElement("div");
    editDeldiv.setAttribute("class", "editdeldiv");
    commentMsg.append(editDeldiv);

    let edit;
    edit = document.createElement("img");
    edit.setAttribute("src", "../../Assets/images/draw.png");
    edit.setAttribute("width", "20");
    edit.setAttribute("height", "20");
    edit.setAttribute("onclick", "edit(this.id)");
    edit.setAttribute("id", comment[i]["commentId"]);
    edit.setAttribute("class", "edit");
    edit.setAttribute("style", "cursor:pointer");
    editDeldiv.append(edit);

    let del;
    del = document.createElement("img");
    del.setAttribute("src", "../../Assets/images/delete.png");
    del.setAttribute("width", "20");
    del.setAttribute("height", "20");
    del.setAttribute("id", comment[i]["commentId"]);
    del.setAttribute("onclick", "del(this.id)");
    del.setAttribute("style", "cursor:pointer");
    editDeldiv.append(del);

    let hr;
    hr = document.createElement("hr");

    document.querySelector(".chat-history").append(commentMsg, hr);
  } else {
    let commentMsg = document.createElement("div");
    commentMsg.setAttribute("class", "chat-message");
    let userImg;
    userImg = document.createElement("img");
    userImg.setAttribute("src", comment[i]["userpic"]);
    userImg.setAttribute("alt", "profile");
    userImg.setAttribute("width", "32");
    userImg.setAttribute("height", "32");
    userImg.setAttribute("style", "border-radius: 50%");
    commentMsg.append(userImg);
    let msgcontent;
    msgcontent = document.createElement("div");
    msgcontent.setAttribute("class", "chat-message-content");
    commentMsg.append(msgcontent);
    let spanTime;
    spanTime = document.createElement("div");
    spanTime.setAttribute("class", "chat-time");
    spanTime.innerText = comment[i]["time"];
    msgcontent.append(spanTime);
    let heading_user;
    heading_user = document.createElement("h5");
    heading_user.innerText = comment[i]["userName"];
    msgcontent.append(heading_user);
    let msg;
    msg = document.createElement("p");
    msg.setAttribute("style", "color: black");
    msg.innerText = comment[i]["msg"];
    msgcontent.append(msg);
    let hr;
    hr = document.createElement("hr");
    document.querySelector(".chat-history").append(commentMsg, hr);
  }
}

// function edit() {
//   document.getElementById("editfieldset").classList.toggle("active");
// }

// to edit the comment
function edit(id) {
  console.log(id);
  window.localStorage.setItem("commentId", JSON.stringify(id));
  document.getElementById("editfieldset").classList.toggle("active");
}

let form;
form = document.createElement("form");

let form2;
form2 = document.createElement("form");
form.prepend(form2);

let fieldset2;
fieldset2 = document.createElement("fieldset");
fieldset2.setAttribute("id", "editfieldset");
form2.append(fieldset2);

let editinput;
editinput = document.createElement("input");
editinput.setAttribute("type", "text");
editinput.setAttribute("autocomplete", "off");
editinput.setAttribute("id", "editinput");
editinput.setAttribute("placeholder", "edit Your message");
fieldset2.append(editinput);

let sendIcon2;
sendIcon2 = document.createElement("img");
sendIcon2.setAttribute("src", "../../Assets/images/send-message.png");
sendIcon2.setAttribute("alt", "send");
sendIcon2.setAttribute("class", "send");
sendIcon2.setAttribute("onclick", "sendedit()");
sendIcon2.setAttribute("width", "20");
sendIcon2.setAttribute("height", "20");
sendIcon2.setAttribute("style", "padding-top: 5px");
fieldset2.append(sendIcon2);

let fieldset;
fieldset = document.createElement("fieldset");
form.append(fieldset);

let inputMsg;
inputMsg = document.createElement("input");
inputMsg.setAttribute("type", "text");
inputMsg.setAttribute("autocomplete", "off");
inputMsg.setAttribute("id", "msg");
inputMsg.setAttribute("placeholder", "Send your message");
fieldset.append(inputMsg);

let sendIcon;
sendIcon = document.createElement("img");
sendIcon.setAttribute("src", "../../Assets/images/send-message.png");
sendIcon.setAttribute("alt", "send");
sendIcon.setAttribute("class", "send");
sendIcon.setAttribute("onclick", "send()");
sendIcon.setAttribute("width", "20");
sendIcon.setAttribute("height", "20");
sendIcon.setAttribute("style", "padding-top: 5px");
fieldset.append(sendIcon);

document.querySelector(".chat-history").append(form);

let userCommentId = JSON.parse(window.localStorage.getItem("commentId"));
console.log(userCommentId);
let userallComments = JSON.parse(window.localStorage.getItem("commentmain"));

let Com = userallComments.find(function (comment) {
  let Comment = comment["commentId"];

  if (userCommentId == Comment) {
    return true;
  }
});
console.log(Com);

function sendedit() {
  let msg = document.getElementById("editinput").value;

  let neweditObj = {
    msg,
  };
  console.log(neweditObj);
  let merge;
  merge = Object.assign(Com, neweditObj);
  let usereditmsg;
  usereditmsg = userallComments.indexOf(Com);
  userallComments[usereditmsg] = merge;
  window.localStorage.setItem("commentmain", JSON.stringify(userallComments));
  location.reload();
}

// to delete the comment
function del(commentid) {
  let commentINdex = userallComments.indexOf(Com);

  let alertComfirm = confirm("Are you sure you want to delete this comment");

  if (alertComfirm != true) {
    return;
  } else {
    window.localStorage.setItem("commentId", JSON.stringify(commentid));
    userallComments.splice(commentINdex, 1);
    window.localStorage.setItem("commentmain", JSON.stringify(userallComments));
    location.reload();
  }
}
