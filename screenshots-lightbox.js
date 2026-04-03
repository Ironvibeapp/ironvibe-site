(function () {
  var TOTAL = 7;
  var lightbox = null;
  var lightboxImg = null;
  var backdrop = null;
  var currentIndex = 1;
  var openState = false;

  function themeFolder() {
    return document.documentElement.getAttribute("data-theme") === "dark" ? "dark" : "light";
  }

  function urlForIndex(i) {
    var f = themeFolder();
    return "../screenshots/" + f + "/" + i + ".jpg?v=" + f;
  }

  function applyIndex(i) {
    if (i < 1) i = TOTAL;
    if (i > TOTAL) i = 1;
    currentIndex = i;
    if (lightboxImg) {
      var url = urlForIndex(currentIndex);
      lightboxImg.setAttribute("src", url);
      lightboxImg.src = url;
      lightboxImg.alt = "IronVibe screenshot " + currentIndex;
    }
  }

  function openAt(raw) {
    var n = parseInt(raw, 10);
    if (isNaN(n) || n < 1 || n > TOTAL) n = 1;
    applyIndex(n);
    if (!lightbox) return;
    lightbox.classList.remove("hidden");
    lightbox.classList.add("flex");
    document.body.style.overflow = "hidden";
    openState = true;
  }

  function close() {
    if (!lightbox) return;
    lightbox.classList.add("hidden");
    lightbox.classList.remove("flex");
    document.body.style.overflow = "";
    openState = false;
  }

  function prev() {
    applyIndex(currentIndex === 1 ? TOTAL : currentIndex - 1);
  }

  function next() {
    applyIndex(currentIndex === TOTAL ? 1 : currentIndex + 1);
  }

  /** Theme switched while viewer open — swap image; thumbs updated by theme-toggle. */
  window.ironVibeGalleryRefresh = function () {
    if (!openState || !lightboxImg) return;
    var wrap = lightboxImg.parentNode;
    if (!wrap) return;
    var url = urlForIndex(currentIndex);
    var next = lightboxImg.cloneNode(false);
    next.id = "lightbox-img";
    next.alt = "IronVibe screenshot " + currentIndex;
    next.className = lightboxImg.className;
    next.src = url;
    wrap.replaceChild(next, lightboxImg);
    lightboxImg = next;
  };

  document.addEventListener("DOMContentLoaded", function () {
    lightbox = document.getElementById("lightbox");
    lightboxImg = document.getElementById("lightbox-img");
    backdrop = document.getElementById("lightbox-backdrop");
    var btnClose = document.getElementById("lightbox-close");
    var btnPrev = document.getElementById("lightbox-prev");
    var btnNext = document.getElementById("lightbox-next");
    if (!lightbox || !lightboxImg) return;

    document.querySelectorAll("[data-screenshot]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        openAt(btn.getAttribute("data-screenshot"));
      });
    });

    if (btnClose)
      btnClose.addEventListener("click", function (e) {
        e.stopPropagation();
        close();
      });
    if (btnPrev)
      btnPrev.addEventListener("click", function (e) {
        e.stopPropagation();
        prev();
      });
    if (btnNext)
      btnNext.addEventListener("click", function (e) {
        e.stopPropagation();
        next();
      });
    if (backdrop) backdrop.addEventListener("click", close);

    document.addEventListener("keydown", function (e) {
      if (!openState || !lightbox || lightbox.classList.contains("hidden")) return;
      if (e.key === "Escape") close();
      else if (e.key === "ArrowLeft") prev();
      else if (e.key === "ArrowRight") next();
    });
  });
})();
