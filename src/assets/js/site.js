document.querySelectorAll("pre div").forEach((element) => {
  let html = element.outerHTML;
  let pattern = html.match(/\s*\n[\t\s]*/);

  element.outerHTML = html.replace(new RegExp(pattern, "g"), "\n");
});

document.querySelectorAll("pre code").forEach((element) => {
  let html = element.outerHTML;
  let pattern = html.match(/\s*\n[\t\s]*/);

  element.outerHTML = html.replace(new RegExp(pattern, "g"), "\n");
});

// ========================================
// Handle the header.
// ========================================

// const body = document.body;

// const headerTop = document.querySelector(".article-header .header-top");
// const headerBottom = document.querySelector(".article-header .header-bottom");

// const scrollUp = "scroll-up";
// const scrollDown = "scroll-down";

// let lastScroll = 0;

// function calculateOffsets() {
//   const headerTopHeight = headerTop.offsetHeight;
//   const headerBottomHeight = headerBottom.offsetHeight;

//   headerBottom.style.top = `${headerTopHeight}px`;
//   body.style.paddingTop = `${headerTopHeight + headerBottomHeight}px`;
// }

// calculateOffsets();

// window.addEventListener("resize", () => {
//   calculateOffsets();
// });

// window.addEventListener("scroll", () => {
//   const currentScroll = window.pageYOffset;
//   const headerTopHeight = headerTop.offsetHeight;
//   const headerBottomHeight = headerBottom.offsetHeight;

//   if (currentScroll <= 0) {
//     body.classList.remove(scrollUp);
//   }

//   // This if block handles the ability of the header top to appear
//   // and disappear per the scroll.
//   if (currentScroll > lastScroll && !body.classList.contains(scrollDown)) {
//     // User has scrolled down.

//     body.classList.remove(scrollUp);
//     body.classList.add(scrollDown);
//     headerBottom.style.transform = `translateY(-${headerTopHeight}px)`;
//     body.style.paddingTop = `${headerBottomHeight}px`;
//   } else if (
//     currentScroll < lastScroll &&
//     body.classList.contains(scrollDown)
//   ) {
//     // User has scrolled up.

//     body.classList.remove(scrollDown);
//     body.classList.add(scrollUp);
//     headerBottom.style.transform = "none";
//     body.style.paddingTop = `${headerTopHeight + headerBottomHeight}px`;
//   }

//   lastScroll = currentScroll;
// });

// ========================================
// Handle menu toggle.
// ========================================

const menu = document.querySelector(".article-header .header-bottom .menu");
const toggleMenu = document.querySelector(
  ".article-header .header-bottom .toggle-menu",
);

toggleMenu.addEventListener("click", () => {
  menu.classList.toggle("is-visible");
});

// ========================================
// Handle the progress bar.
// ========================================

const page_progress_bar = document.querySelector(".progress-bar");

const scroll_container = () => {
  return document.documentElement || document.body;
};

document.addEventListener("scroll", () => {
  const scrolled_percentage =
    (scroll_container().scrollTop /
      (scroll_container().scrollHeight - scroll_container().clientHeight)) *
    100;

  page_progress_bar.style.width = `${scrolled_percentage}%`;
});

// ========================================
// Handle the light/dark mode.
// ========================================

if (window.CSS && CSS.supports("color", "var(--primary)")) {
  const toggleColorMode = (e) => {
    if (e.currentTarget.classList.contains("light--hidden")) {
      document.documentElement.setAttribute("color-mode", "light");
      localStorage.setItem("color-mode", "light");

      return;
    }

    document.documentElement.setAttribute("color-mode", "dark");
    localStorage.setItem("color-mode", "dark");
  };

  const toggleColorButtons = document.querySelectorAll(".color-mode-btn");

  toggleColorButtons.forEach((btn) => {
    btn.addEventListener("click", toggleColorMode);
  });
} else {
  const toggleButton = document.querySelector(".dark--hidden");
  toggleButton.style.display = "none";
}
