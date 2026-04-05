/**
 * Cookie + age (18+) consent. Fixed corner glass banner — does not wrap or obscure <main> (SEO-friendly).
 * localStorage: user_consent_accepted = "1"
 */
(function () {
  var STORAGE_KEY = "user_consent_accepted";
  var LOCALES = ["en", "ru", "ar", "de", "es", "fr", "hi", "it", "pt", "zh"];

  var translationsPromise = null;

  function tryStorage() {
    try {
      var v = window.localStorage.getItem(STORAGE_KEY);
      return v === "1" || v === "true";
    } catch (e) {
      return false;
    }
  }

  function setStorage() {
    try {
      window.localStorage.setItem(STORAGE_KEY, "1");
    } catch (e) {}
  }

  /** Locale folder for translations.json (root-relative URL avoids /en vs /en/ resolution bugs). */
  function resolveLocaleForTranslations() {
    var path = (window.location.pathname || "/").replace(/\/$/, "");
    var segs = path.split("/").filter(Boolean);
    if (segs.length >= 1 && LOCALES.indexOf(segs[0]) !== -1) {
      return segs[0];
    }
    if (segs.length === 1 && (segs[0] === "privacy" || segs[0] === "donate")) {
      var dl = document.documentElement.getAttribute("data-locale");
      if (dl && LOCALES.indexOf(dl) !== -1) return dl;
      var lng = (document.documentElement.getAttribute("lang") || "en").split("-")[0].toLowerCase();
      if (LOCALES.indexOf(lng) !== -1) return lng;
      return "en";
    }
    return "en";
  }

  function translationsUrl() {
    return "/" + resolveLocaleForTranslations() + "/translations.json";
  }

  function beginTranslationsFetch() {
    if (translationsPromise) return translationsPromise;
    translationsPromise = fetch(translationsUrl(), { credentials: "same-origin" })
      .then(function (r) {
        return r.ok ? r.json() : null;
      })
      .catch(function () {
        return null;
      });
    return translationsPromise;
  }

  function getHomeString(t, key, fallback) {
    if (!t || !t.home) return fallback;
    var v = t.home[key];
    return v != null && String(v).length ? String(v) : fallback;
  }

  function applyStrings(wrap, textEl, btn, t) {
    var text = getHomeString(
      t,
      "consentBannerText",
      "We use cookies to enhance your experience. By continuing, you confirm you are 18+."
    );
    var btnLabel = getHomeString(t, "consentAccept", "Accept & Enter");
    var aria = getHomeString(t, "consentAria", "Cookies and age notice");
    textEl.textContent = text;
    btn.textContent = btnLabel;
    btn.setAttribute("aria-label", btnLabel);
    wrap.setAttribute("aria-label", aria);
  }

  function removeBanner(el) {
    if (!el || !el.parentNode) return;
    el.classList.add("iv-consent-banner--hide");
    var done = false;
    function finish() {
      if (done) return;
      done = true;
      el.remove();
    }
    el.addEventListener(
      "transitionend",
      function te(ev) {
        if (ev.target !== el) return;
        if (ev.propertyName !== "opacity") return;
        el.removeEventListener("transitionend", te);
        finish();
      },
      false
    );
    window.setTimeout(finish, 450);
  }

  function mount(t) {
    if (tryStorage()) return;
    if (document.getElementById("iv-consent-banner")) return;

    var wrap = document.createElement("div");
    wrap.id = "iv-consent-banner";
    wrap.className = "iv-consent-banner";
    wrap.setAttribute("role", "region");
    wrap.setAttribute("data-nosnippet", "");

    var text = document.createElement("p");
    text.className = "iv-consent-banner__text";
    text.id = "iv-consent-banner-desc";

    var btn = document.createElement("button");
    btn.type = "button";
    btn.className = "iv-consent-banner__btn";
    btn.setAttribute("aria-describedby", "iv-consent-banner-desc");

    applyStrings(wrap, text, btn, t);

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
    if (!document.body) return;
    beginTranslationsFetch().then(function (json) {
      mount(json);
    });
  }

  if (!tryStorage()) {
    beginTranslationsFetch();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
