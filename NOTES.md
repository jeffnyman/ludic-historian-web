Modern reset ideas came from here:

- https://www.ellyloel.com/projects/modern-css-reset/

The upper header came from here (although I modified heavily):

- https://webdesign.tutsplus.com/tutorials/hide-reveal-sticky-notification-bar-on-scroll-with-javascript--cms-37012

- https://www.freecodecamp.org/news/back-to-top-button-and-page-progressbar-with-html-css-and-js/

Used this for the side menu:

- https://codepen.io/mkurapov/pen/WwVvZy/

This was a contender for another side menu:

- https://codepen.io/Noble-Nate/pen/wKqYrY

This was used for the scroll to top:

- https://codepen.io/rolandtoth/pen/eMamVK

Scrollbar styling was from here:

- https://css-tricks.com/the-current-state-of-styling-scrollbars-in-css/

This served as another reference for scrollbar styling:

- https://www.digitalocean.com/community/tutorials/css-scrollbars

My `html` element did have the following at one point:

```
background-color: #393939;
background-color: #f2f2f2;
background-image: url("../assets/site/lh-background.png");
```

The #393939 matches the color, although not the subtle pattern, of the lh-background.png.

The `article` had the following at one point:

```
background-color: #f2f2f2;
```

A previous implemention of the dark/light mode toggle was:

```
<input checked type="checkbox" name="checkbox" class="color-toggle light">
```

The specific JavaScript logic for that toggle was:

```
// Handle toggling the color mode of the site.

if (window.CSS && CSS.supports("color", "var(--primary)")) {
  const toggleColorMode = () => {
    if (document.documentElement.getAttribute("color-mode") == "dark") {
      document.documentElement.setAttribute("color-mode", "light");

      return;
    }

    document.documentElement.setAttribute("color-mode", "dark");
  };

  const toggleColor = document.querySelector(".color-toggle");
  toggleColor.addEventListener("click", toggleColorMode);
} else {
  const toggleColor = document.querySelector(".color-toggle");
  toggleColor.style.display = "none";
}
```

    <!-- <button class="back-to-top hidden">
      <svg class="back-to-top-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l7.5-7.5 7.5 7.5m-15 6l7.5-7.5 7.5 7.5" />
      </svg>
    </button> -->

    <!-- <button class="back-to-top hidden">
      <svg class="back-to-top-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l7.5-7.5 7.5 7.5m-15 6l7.5-7.5 7.5 7.5" />
      </svg>
    </button> -->

.hidden {
opacity: 0%;
}
