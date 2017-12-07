/*slider*/

var contentMains = document.getElementsByClassName('content_main'); //getelement by "content_main"

for (var i = 0; i < contentMains.length; i++) {
    //run function directly
    (function () {
        var index = 1; //slide index

        var contentMain = contentMains[i];
        var backBtn = contentMain.getElementsByClassName('btn_back')[0];
        var nextBtn = contentMain.getElementsByClassName('btn_next')[0];
        //if you click btn_back, content move
        backBtn.onclick = function () {
            index -= 1;
            Slide(contentMain, index);
        };
        //if you click btn_next, content move
        nextBtn.onclick = function () {
            index += 1;
            Slide(contentMain, index);
        };

    })();
}



function Slide(contentMain, n) {
    var i;
    var contentLoads = contentMain.getElementsByClassName("content_load");
    slideIndexindex = n //index input to slideIndex
    console.log(n);
    if (n > contentLoads.length) { //if content page is last
        slideIndexindex = 1; //go to first
    }
    if (n < 1) { //if content page is first
        slideIndexindex = contentLoads.length; //go to last
    }
    for (i = 0; i < contentLoads.length; i++) {
        contentLoads[i].style.display = "none";
    } //if you click button, slide
    contentLoads[slideIndexindex - 1].style.display = "block";
}