/*modal*/

//content_img's class is "article"
var article = document.getElementsByClassName("article");

for (var i = 0; i < article.length; i++) {
    //if you click img
    article[i].onclick = function () {
            //show Modal
            //argument=get Attribute of article[i] "seqArticle"
            showModal(this.getAttribute("seqArticle"));
        }
        //if you click other part of page
    window.onclick = function () {
        hideModal(event); //hide Modal
    }

}
//show Modal
function showModal(seqarticle) {
    var target = "../html/article/main/Article_" + seqarticle + ".html"; //external html file address
    var modal = document.getElementsByClassName("modal")[0]; //modal background
    modal.children[0].setAttribute("src", target); //set src of iframe to target
    modal.style.display = "block"; //modal style change "none" to "block"
}
//hide Modal
function hideModal(event) {
    var modal = document.getElementsByClassName("modal")[0]; //modal background
    //if you click other part of page
    if (event.target == modal) {
        modal.style.display = "none"; //modal style change "block" to "none"
    }
    //if you get message frome iframe (x)
    window.onmessage = function () {
        modal.style.display = "none"; //modal style change "block" to "none"
    }
}