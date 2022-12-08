// Check how the color mode of the site should be defaulted. This is
// done by checking whether the user has (set a site preference for
// dark mode) OR (an OS-level prefererence for dark mode AND no site
// preference).

// Another way to put it: if the user has set an OS-level preference
// for a color scheme and has NOT set a preference on the site itself
// during an earlier visit, then the site will respect the OS-level
// preference. If a site-level preference was set, however, then the
// site will respect that preference, over the OS-level preference.

if (
  localStorage.getItem("color-mode") === "dark" ||
  (window.matchMedia("(prefers-color-scheme: dark)").matches &&
    !localStorage.getItem("color-mode"))
) {
  document.documentElement.setAttribute("color-mode", "dark");
}
