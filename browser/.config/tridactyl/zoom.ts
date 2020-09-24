var img = document.images[0];
var iw = img.width;
var ih = img.height;
var ir = iw / ih;

function togglezoom() {
	if (img.width==iw&&img.height==ih) {
		zoom();
	}else{
    img.width = iw;
		img.height = ih;
		img.setAttribute("style","cursor:-moz-zoom-out");
  }
}

function zoom() {
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

img.addEventListener("click", togglezoom, false);
img.setAttribute("style","cursor:-moz-zoom-in");
