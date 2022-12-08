// Get the modal.
// Get the image and insert it inside the modal.
// Use the image's "alt" text as a caption.

var modal = document.getElementById("img-modal");
var modalImg = document.getElementById("img-modal-content");
var captionText = document.getElementById("img-modal-caption");

document.addEventListener("click", (e) => {
  const elem = e.target;

  if (elem.className === "cover thumbnail") {
    modal.style.display = "block";
    modalImg.src = elem.dataset.biggerSrc || elem.src;
    captionText.innerHTML = elem.alt;
  }
});

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("img-modal-close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
  modal.style.display = "none";
};

// When the user clicks on the expanded modal, close the modal
modal.onclick = function () {
  modal.style.display = "none";
};
