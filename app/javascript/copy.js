function copy() {
  
    const text = document.getElementById("user1");
  text.select();
  document.execCommand("Copy");
}

if (document.URL.match( /sign_in/ )) {
  window.addEventListener("load", copy);
}