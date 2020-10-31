function preview() {
  const previewSpace = document.querySelector(".preview");
  const imageForm = document.getElementById("tweet_tag_form_image");

  imageForm.addEventListener("change", function(e){
    const setImage = document.querySelector(".image");
    if (setImage) {
      setImage.remove();
    }
    const imageFile = e.target.files[0];
    const imageUrl = window.URL.createObjectURL(imageFile);
    const image = document.createElement("img");
    image.setAttribute("src", imageUrl);
    image.setAttribute("class", "image");
    previewSpace.appendChild(image);
  });
}

if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener("load", preview);
}