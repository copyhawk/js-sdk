var XFoo = document.registerElement('j-cms');
var elem = document.getElementById("test");
function getScripts(e) {
    var r = new XMLHttpRequest();
    r.open("GET", "http://localhost:3000/api/5619dab3ada92090225698bf", true);
    r.onreadystatechange = function () {
        if (r.readyState != 4 || r.status != 200) return;
        elem.innerText = r.responseText;
    };
    r.send("a=1&b=2&c=3")
}

getScripts();