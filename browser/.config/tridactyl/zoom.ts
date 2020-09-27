function togglezoom(img) {
	if (img.width==iw&&img.height==ih) {
		zoom(img);
	}else{
        img.width = iw;
		img.height = ih;
		img.setAttribute("style","cursor:-moz-zoom-out");
  }
}

function zoom(img) {
	var ww = window.innerWidth;
	var wh = window.innerHeight;
  
	var zohw = wh * ir;

	if (zohw<=ww) {
			img.height = wh;
			img.width = img.height * ir;
	} else {
			img.width = ww;
			img.height = img.width / ir;
	}
}

var iw = 0;
var ih = 0;
var ir = 0;

Array.prototype.forEach.call(document.images, function (img) {
    iw = img.width;
    ih = img.height;
    ir = iw / ih;
    img.addEventListener("click", () => { togglezoom(img); }, false);
    img.setAttribute("style","cursor:-moz-zoom-in");
});

// for (var img in imgs) {
//     var iw = img.width;
//     var ih = img.height;
//     var ir = iw / ih;
//     // alert(iw);
//     // img.addEventListener("click", togglezoom(img), false);
//     // img.setAttribute("style","cursor:-moz-zoom-in");
// }
