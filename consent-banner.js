/**
 * Cookie + age (18+) consent. Non-blocking corner banner; no server-side gate (SEO-friendly).
 * localStorage key: user_consent_accepted (= "1")
 */
(function () {
  var STORAGE_KEY = "user_consent_accepted";
  var LOCALES = ["en", "ru", "ar", "de", "es", "fr", "hi", "it", "pt", "zh"];

  function translationsUrl() {
    var segs = window.location.pathname.replace(/\/$/, "").split("/").filter(Boolean);
    if (
      segs.length >= 2 &&
      LOCALES.indexOf(segs[0]) !== -1 &&
      (segs[1] === "donate" || segs[1] === "privacy")
    ) {
      return "../translations.json";
    }
    /* /privacy/ or /donate/ at site root (no locale segment): use <html lang> or data-locale */
    if (segs.length === 1 && (segs[0] === "privacy" || segs[0] === "donate")) {
      var dl = document.documentElement.getAttribute("data-locale");
      if (dl && LOCALES.indexOf(dl) !== -1) return "../" + dl + "/translations.json";
      var lng = (document.documentElement.getAttribute("lang") || "en").split("-")[0].toLowerCase();
      if (LOCALES.indexOf(lng) !== -1) return "../" + lng + "/translations.json";
      return "../en/translations.json";
    }
    return "translations.json";
  }

  function getHomeString(t, key, fallback) {
    if (!t || !t.home) return fallback;
    var v = t.home[key];
    return v != null && String(v).length ? String(v) : fallback;
  }

  function tryStorage() {
    try {
      return window.localStorage.getItem(STORAGE_KEY) === "1";
    } catch (e) {
      return false;
    }
  }

  function setStorage() {
    try {
      window.localStorage.setItem(STORAGE_KEY, "1");
    } catch (e) {}
  }

  function applyStrings(textEl, btn, t) {
    var text = getHomeString(
      t,
      "consentBannerText",
      "We use cookies to enhance your experience. By continuing, you confirm you are 18+."
    );
    var btnLabel = getHomeString(t, "consentAccept", "Accept & Enter");
    textEl.textContent = text;
    btn.textContent = btnLabel;
    btn.setAttribute("aria-label", btnLabel);
  }

  function removeBanner(el) {
    if (!el || !el.parentNode) return;
    el.classList.add("iv-consent-banner--hide");
    function done() {
      el.remove();
    }
    el.addEventListener("transitionend", function te(ev) {
      if (ev.propertyName === "opacity") {
        el.removeEventListener("transitionend", te);
        done();
      }
    });
    setTimeout(done, 400);
  }

  function mount(t) {
    if (tryStorage()) return;

    var wrap = document.createElement("div");
    wrap.id = "iv-consent-banner";
    wrap.className = "iv-consent-banner";
    wrap.setAttribute("role", "region");
    wrap.setAttribute("aria-label", getHomeString(t, "consentAria", "Cookies and age notice"));

    var text = document.createElement("p");
    text.className = "iv-consent-banner__text";
    text.id = "iv-consent-banner-desc";

    var btn = document.createElement("button");
    btn.type = "button";
    btn.className = "iv-consent-banner__btn";
    btn.setAttribute("aria-describedby", "iv-consent-banner-desc");

    applyStrings(text, btn, t);

    btn.addEventListener("click", function () {
      setStorage();
      removeBanner(wrap);
    });

    wrap.appendChild(text);
    wrap.appendChild(btn);

    document.body.appendChild(wrap);
    requestAnimationFrame(function () {
      wrap.classList.add("iv-consent-banner--visible");
    });
  }

  function init() {
    if (tryStorage()) return;

    var url = translationsUrl();
    var done = function (json) {
      mount(json);
    };

    fetch(url)
      .then(function (r) {
        return r.ok ? r.json() : null;
      })
      .then(function (j) {
        return done(j || null);
      })
      .catch(function () {
        done(null);
      });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
