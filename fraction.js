var copyHawkMaster;

(function() {
  copyHawkMaster = {
    init: function() {
      var lookup = document.getElementsByTagName('c-hawk-init')[0].dataset;
      this.siteToken = lookup.siteToken;
      this.language = lookup.defaultLanguage;
      this.supportedLanguages = lookup.supportedLanguages;
      if (lookup.environment == "preview") {
        this.preview = true;
      }
      this.noCache = new Date().getTime();
    }
  }
  copyHawkMaster.init();
})();

function getDefault(label) {
  // Fail fast simple debug
  return "[ch-error: missing label "+label+" ]";
}

function getPreviewText(token, label, lang, cacheKey, element) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      element.innerHTML = xhttp.responseText;
    } else if (xhttp.readyState == 4 && xhttp.status == 404) {
      element.innerHTML = getDefault(label);
    }
  }
  xhttp.open("GET", "//localhost:3000/api/p/staging." + token + "/" + label + "?lang="+lang+"&cache="+cacheKey, true);
  xhttp.setRequestHeader("Content-Type", "text/plain");
  xhttp.send();
}

function getLiveText(token, label, lang, cacheKey, element) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      element.innerHTML = xhttp.responseText;
    } else if (xhttp.readyState == 4 && xhttp.status == 404) {
      element.innerHTML = getDefault(label);
    }
  }
  xhttp.open("GET", "//localhost:3000/api/" + token + "/" + label + "?lang="+lang+"&cache="+cacheKey, true);
  xhttp.setRequestHeader("Content-Type", "text/plain");
  xhttp.send();
}

// Init script tags
var cHawkProto = Object.create(HTMLElement.prototype);
cHawkProto.createdCallback = function () {
  if (copyHawkMaster.preview) {
    getPreviewText(copyHawkMaster.siteToken, this.dataset.label, copyHawkMaster.language, copyHawkMaster.noCache, this);
  } else {
    getLiveText(copyHawkMaster.siteToken, this.dataset.label, copyHawkMaster.language, copyHawkMaster.noCache, this);
  }
};
var cHawk = document.registerElement("c-hawk", {prototype: cHawkProto});