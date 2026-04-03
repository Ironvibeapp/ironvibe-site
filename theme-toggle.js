(function () {
  var STORAGE_KEY = "ironvibe-site-theme";

  function getTheme() {
    return document.documentElement.getAttribute("data-theme") === "dark" ? "dark" : "light";
  }

  function applyTheme(theme) {
    if (theme === "dark") {
      document.documentElement.setAttribute("data-theme", "dark");
    } else {
      document.documentElement.removeAttribute("data-theme");
    }
  }

  function persist(theme) {
    try {
      if (theme === "dark") localStorage.setItem(STORAGE_KEY, "dark");
      else localStorage.removeItem(STORAGE_KEY);
    } catch (e) {}
  }

  function syncScreenshotThumbs() {
    var dark = getTheme() === "dark";
    var folder = dark ? "dark" : "light";
    document.querySelectorAll("[data-screenshot]").forEach(function (el) {
      var n = el.getAttribute("data-screenshot");
      if (!n) return;
      var url = "../screenshots/" + folder + "/" + n + ".jpg";
      el.setAttribute("data-lightbox", url);
      var img = el.querySelector("img");
      if (img) {
        /* Lazy-loaded thumbs often ignore setAttribute("src") swaps; assign .src and drop lazy so the browser always repaints. */
        img.removeAttribute("loading");
        img.src = url;
      }
    });
  }

  function setTheme(theme) {
    applyTheme(theme);
    persist(theme);
    syncToggleUi();
    syncScreenshotThumbs();
    if (window.ironVibeGalleryRefresh) window.ironVibeGalleryRefresh();
  }

  function toggleTheme() {
    setTheme(getTheme() === "dark" ? "light" : "dark");
  }

  function syncToggleUi() {
    var dark = getTheme() === "dark";
    var sun =
      '<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"/></svg>';
    var moon =
      '<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"/></svg>';
    document.querySelectorAll("[data-theme-toggle]").forEach(function (btn) {
      btn.innerHTML = dark ? sun : moon;
      btn.setAttribute("aria-pressed", dark ? "true" : "false");
      var toLight = btn.getAttribute("data-aria-light") || "Switch to light mode";
      var toDark = btn.getAttribute("data-aria-dark") || "Switch to dark mode";
      btn.setAttribute("aria-label", dark ? toLight : toDark);
    });
  }

  window.ironVibeToggleTheme = toggleTheme;
  window.ironVibeSyncThemeToggle = syncToggleUi;
  window.ironVibeSyncScreenshotThumbs = syncScreenshotThumbs;

  document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("[data-theme-toggle]").forEach(function (btn) {
      btn.addEventListener("click", toggleTheme);
    });
    syncToggleUi();
    syncScreenshotThumbs();
  });
})();
