//start after window loaded
window.onload = function () {
    var close = document.getElementsByClassName("close")[0]; //get element by "close"
    close.onclick = function () { //if you click close icon
        click_close();
    };
    //postMessage to parant html of iframe
    function click_close() {
        parent.postMessage('click_close', "*");
    }
}