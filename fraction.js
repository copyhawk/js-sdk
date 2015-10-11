var XFoo = document.registerElement('j-cms');
var elem = document.getElementById("test");
var elem2 = document.getElementById("test2");

// NAIVE POC - Will have to get fancy up in here
function getScripts(e) {
    var r = new XMLHttpRequest();
    r.open("GET", "http://localhost:3000/api/" + e.getAttribute('data-id'), true);
    r.onreadystatechange = function () {
        if (r.readyState != 4 || r.status != 200) return;
        e.innerText = r.responseText;
    };
    r.send("a=1&b=2&c=3")
}

getScripts(elem);
getScripts(elem2);