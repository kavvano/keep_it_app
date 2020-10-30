function cursor() {
  const tagLists = document.querySelectorAll(".tag_list");

  tagLists.forEach((tagList) => {
    tagList.addEventListener("mouseover", () => {
      tagList.setAttribute("style", "background-color: #eeeeee;");
    });
    tagList.addEventListener("mouseout", () => {
      tagList.removeAttribute("style", "background-color: #eeeeee;");
    });
  });
}

setInterval(cursor, 1000);