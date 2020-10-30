function tag() {
  const inputTag = document.querySelector(".input_tag");

  inputTag.addEventListener("keyup", () => {
    const keyword = document.querySelector(".input_tag").value;
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `search/?keyword=${keyword}`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      const tagList = document.querySelector(".tag_lists");
      tagList.innerHTML = ""
      if (XHR.response) {
        const tags = XHR.response.keyword;
        tags.forEach((tag) => {
          const list = document.createElement("li");
          list.setAttribute("class", "tag_list");
          list.setAttribute("id", tag.id);
          list.innerHTML = tag.name;
          tagList.appendChild(list);
          const clickTag = document.getElementById(tag.id);
          clickTag.addEventListener("click", () => {
            document.querySelector(".input_tag").value = clickTag.textContent;
            const lists = document.querySelectorAll("li");
            lists.forEach((list) => {
              list.remove();
            });
          });
        });
      };
    };
  });
}

window.addEventListener("load", tag);