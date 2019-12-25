
if (window.XMLHttpRequest)
    req = new XMLHttpRequest();
else {
    try {
        req = new ActiveXObject("Msxml2.XMLHTTP");
    }
    catch (e) {
        try {
            req = ActiveXObject("Microsoft.XMLHTTP");
        }
        catch (e) {
            req = null;
        }
    }
}
if (req == null)
    alert("Ajax intiation failed.");


