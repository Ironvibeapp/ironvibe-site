/**
 * Sanitize first-party translation HTML before innerHTML.
 * Allows only <a>, <strong>, <em>, <br>, <span> and safe hrefs.
 */
(function (global) {
  var ALLOWED_TAGS = { A: true, STRONG: true, EM: true, BR: true, SPAN: true };

  function isSafeHref(href) {
    if (!href) return false;
    var h = String(href).trim();
    if (/^mailto:support@ironvibe\.app$/i.test(h)) return true;
    if (/^https:\/\/ironvibe\.app(?:\/|$)/i.test(h)) return true;
    return false;
  }

  function sanitize(html) {
    if (html == null) return "";
    var template = document.createElement("template");
    template.innerHTML = String(html);
    walk(template.content);
    return template.innerHTML;
  }

  function walk(node) {
    Array.prototype.slice.call(node.childNodes).forEach(function (child) {
      if (child.nodeType === 1) {
        if (!ALLOWED_TAGS[child.tagName]) {
          node.replaceChild(document.createTextNode(child.textContent || ""), child);
          return;
        }
        Array.prototype.slice.call(child.attributes).forEach(function (attr) {
          var name = attr.name.toLowerCase();
          if (name.indexOf("on") === 0 || name === "style" || name === "src" || name === "srcset") {
            child.removeAttribute(attr.name);
            return;
          }
          if (name === "href") {
            if (!isSafeHref(attr.value)) child.removeAttribute(attr.name);
            else child.setAttribute("rel", "noopener noreferrer");
            return;
          }
          if (name !== "class") child.removeAttribute(attr.name);
        });
        walk(child);
      } else if (child.nodeType !== 3) {
        node.removeChild(child);
      }
    });
  }

  global.ironVibeSafeHtml = sanitize;
})(window);
