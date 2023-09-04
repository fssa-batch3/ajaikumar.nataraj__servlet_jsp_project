// to get description from form
let detail = document.getElementById("form");

// to create the review array
document.createElement("review");
detail.addEventListener("submit", function (event) {
  event.preventDefault();
  try {
    let array = [];

    if (localStorage.getItem("review") != null) {
      array = JSON.parse(localStorage.getItem("review"));

      location.reload();
    }

    // get the details for store the data in an array
    const Description = document.getElementById("comment").value;
    // const thumbs_up = document.getElementById("thumbs-up-count").value;
    // const thumbs_down = document.getElementById("thumbs-down-count").value;
    const commentId = Date.now();
    const Time = new Date().getHours();
    const Minutes = new Date().getMinutes();
    const currentTime = `${Time}:${Minutes}`;
    const userId = get_obj["id"];
    const Name = get_obj["FullName"];
    let presentDate = new Date().getDate();
    let presentMonth = new Date().getMonth() + 1;
    let presentYear = new Date().getFullYear();

    let currentDate = `${presentYear}-${presentMonth}-${presentDate}`;

    let value = {
      // Name,
      Description,
      commentId,
      // thumbs_up,
      // thumbs_down,
      // down_count,
      // up_count,
      currentTime,
      userId,
      Name,
      currentDate,
    };
    array.push(value);
    localStorage.setItem("review", JSON.stringify(array));
  } catch (error) {
    console.error(error);
  }
});

// get the login details
const review = JSON.parse(localStorage.getItem("review"));

let id = JSON.parse(localStorage.getItem("user_info"));
// console.log(id);

let login_id = JSON.parse(localStorage.getItem("logIn"));
// console.log(login_id);

const get_obj = id.find((e) => e.Email === login_id);
// console.log(get_obj);

for (i = 0; i < review.length; i++) {
  let select_comment = review.find(function (event) {
    try {
      let id = event["commentId"];
      if (review[i]["commentId"] == id) {
        return true;
      }
    } catch (error) {
      console.error(error);
    }
  });
  // console.log(select_comment);
  // to get the logined user's review
  if (review[i]["userId"] == get_obj["id"]) {
    let other_section = document.createElement("section");
    other_section.setAttribute("class", "own_comment");

    let full_nav = document.createElement("nav");
    other_section.append(full_nav);

    let btn_nav = document.createElement("nav");
    btn_nav.setAttribute("class", "button");
    full_nav.append(btn_nav);

    let thumbs_up_div = document.createElement("div");
    // thumbs_up_div.setAttribute("id", "thumbs-up-button");
    thumbs_up_div.setAttribute("class", "thumbs-up");
    thumbs_up_div.setAttribute("alt", "Thumbs up");
    btn_nav.append(thumbs_up_div);

    let thumbs_up_img = document.createElement("img");
    thumbs_up_img.setAttribute("src", "../assets/image/delete.png");
    thumbs_up_img.setAttribute("alt", "delete");
    thumbs_up_img.setAttribute("id", "delete");
    thumbs_up_div.append(thumbs_up_img);

    // let thumbs_up_span = document.createElement("span");
    // thumbs_up_span.setAttribute("id", "thumbs-up-count");
    // thumbs_up_span.innerHTML = 0;
    // thumbs_up_div.append(thumbs_up_span);

    let thumbs_down_div = document.createElement("div");
    // thumbs_down_div.setAttribute("id", "thumbs-down-button");
    thumbs_down_div.setAttribute("class", "thumbs-down");
    btn_nav.append(thumbs_down_div);

    let thumbs_down_img = document.createElement("img");
    thumbs_down_img.setAttribute("src", "../assets/image/edit.png");
    thumbs_down_img.setAttribute("alt", "edit");
    thumbs_down_img.setAttribute("id", "edit");
    thumbs_down_div.append(thumbs_down_img);

    // let thumbs_down_span = document.createElement("span");
    // thumbs_down_span.setAttribute("id", "thumbs-down-count");
    // thumbs_down_span.innerHTML = 0;
    // thumbs_down_div.append(thumbs_down_span);

    // to set the time for review
    let name = document.createElement("p");
    name.innerText =
      review[i]["Name"] +
      "  " +
      review[i]["currentDate"] +
      " " +
      review[i]["currentTime"];
    full_nav.append(name);

    let text_div = document.createElement("div");
    text_div.setAttribute("class", "text_div");
    full_nav.append(text_div);

    let command_area = document.createElement("textarea");
    command_area.setAttribute("type", "text");
    command_area.setAttribute("row", "10");
    command_area.setAttribute("coloumn", "10");
    command_area.setAttribute("id", "feedback");
    command_area.setAttribute("class", "others");
    command_area.innerText = review[i]["Description"];
    text_div.append(command_area);

    let profile_img = document.createElement("img");
    profile_img.setAttribute("src", "../assets/image/profile.png");
    profile_img.setAttribute("alt", "pro");
    profile_img.setAttribute("width", "100px");
    profile_img.setAttribute("height", "100px");
    profile_img.setAttribute("class", "profile");
    text_div.append(profile_img);

    // for edit the login user's review
    thumbs_down_img.addEventListener("click", function (event) {
      event.preventDefault();

      try {
        // console.log(edit_comment);

        const desc = document.getElementById("feedback").value;

        // console.log(desc);

        desc.value = select_comment["Description"];

        let Description = document.getElementById("feedback").value;
        console.log(Description);

        let new_desc = {
          Description,
        };
        // console.log(new_desc);

        let change_desc = Object.assign(select_comment, new_desc);

        // alert("successfully changed");

        let findIndex = review.indexOf(select_comment);
        review[findIndex] = change_desc;
        localStorage.setItem("review", JSON.stringify(review));

        location.reload();
      } catch (error) {
        console.error(error);
      }
    });

    // for delete the login user's review
    thumbs_up_img.addEventListener("click", function (event) {
      event.preventDefault();
      try {
        let comment_delete = review.indexOf(select_comment);
        let msg = confirm("Are you sure you want to delete your comment");
        if (msg !== true) {
          return;
        } else {
          review.splice(comment_delete, 1);
          localStorage.setItem("review", JSON.stringify(review));
        }

        location.reload();
      } catch (error) {
        console.error(error);
      }
    });

    document.querySelector(".others_comment").append(other_section);
  }
}

// show the other user's comments
for (i = 0; i < review.length; i++) {
  let findDetail = review.find(function (event) {
    try {
      let id = event["commentId"];
      if (review[i]["commentId"] == id) {
        return true;
      }
    } catch (error) {
      console.error(error);
    }
  });

  if (review[i]["userId"] !== get_obj["id"]) {
    let other_section = document.createElement("section");
    other_section.setAttribute("class", "other_comment");

    let full_nav = document.createElement("nav");
    other_section.append(full_nav);

    let btn_nav = document.createElement("nav");
    btn_nav.setAttribute("class", "button");
    btn_nav.setAttribute("id", "btn");
    full_nav.append(btn_nav);

    // let thumbs_up_div = document.createElement("div");
    // thumbs_up_div.setAttribute("id", "like_button");
    // thumbs_up_div.setAttribute("class", "thumbs-up");
    // btn_nav.append(thumbs_up_div);

    // let thumbs_up_img = document.createElement("img");
    // thumbs_up_img.setAttribute("src", "../assets/image/thumbs_up.png");
    // thumbs_up_img.setAttribute("alt", "Thumbs up");
    // thumbs_up_div.append(thumbs_up_img);

    // let thumbs_up_span = document.createElement("span");
    // thumbs_up_span.setAttribute("id", "like_count");
    // thumbs_up_span.innerText = review[i]["up_count"];
    // // thumbs_up_span.setAttribute("id", review[i]["count"]);
    // thumbs_up_div.append(thumbs_up_span);

    // let thumbs_down_div = document.createElement("div");
    // thumbs_down_div.setAttribute("id", "dislike-button");
    // thumbs_down_div.setAttribute("class", "thumbs-down");
    // btn_nav.append(thumbs_down_div);

    // let thumbs_down_img = document.createElement("img");
    // thumbs_down_img.setAttribute(
    //   "src",
    //   "../assets/image/thumbs_down.png"
    // );
    // thumbs_down_img.setAttribute("alt", "Thumbs down");
    // thumbs_down_div.append(thumbs_down_img);

    // let thumbs_down_span = document.createElement("span");
    // thumbs_down_span.setAttribute("id", "dislike-count");
    // thumbs_down_span.innerText = review[i]["down_count"];
    // thumbs_down_div.append(thumbs_down_span);
    // console.log(review[i]["down_count"]);

    let name = document.createElement("p");
    name.innerText =
      review[i]["Name"] +
      " " +
      review[i]["currentDate"] +
      " " +
      review[i]["currentTime"];
    full_nav.append(name);

    let text_div = document.createElement("div");
    text_div.setAttribute("class", "text_div");
    full_nav.append(text_div);

    let profile_img = document.createElement("img");
    profile_img.setAttribute("src", "../assets/image/profile.png");
    profile_img.setAttribute("alt", "pro");
    profile_img.setAttribute("width", "100px");
    profile_img.setAttribute("height", "100px");
    profile_img.setAttribute("class", "profile");
    text_div.append(profile_img);

    let command_area = document.createElement("textarea");
    command_area.setAttribute("type", "text");
    command_area.setAttribute("row", "10");
    command_area.setAttribute("coloumn", "10");
    command_area.setAttribute("id", "others");
    command_area.setAttribute("class", "others");
    command_area.innerText = review[i]["Description"];
    text_div.append(command_area);

    // thumbs_up_div.addEventListener("click", function (event) {
    //   event.preventDefault();
    //   let detail = JSON.parse(localStorage.getItem("review"));

    //   const like = document.getElementById("like_count");
    //   console.log(like);

    //   let count = {
    //     up_count: like.value,
    //   };
    //   localStorage.setItem("review", JSON.stringify(count));
    // });

    document.querySelector(".others_comment").append(other_section);
  }
}

function sell_sign() {
  window.location.href = "/pages/1.signin.html";
}
function sell_login() {
  window.location.href = "/pages/2.Login.html";
}
function buy_sign() {
  window.location.href = "/pages/1.buy-signin.html";
}
function buy_login() {
  window.location.href = "/pages/2.buy-login.html";
}
function leader_board() {
  window.location.href = "/pages/leaderboard_seller.html";
}
function about() {
  window.location.href = "/pages/Aboutus.html";
}
function home() {
  window.location.href = "/index.html";
}
function buyer() {
  window.location.href = "/pages/review_buyer.html";
}
