// Zoom To Fit
//
// Simon H Moore
//
// This script takes the first image on a page and changes its size
// to fit the window.
// It is meant to be used with pages that only show one image.

// Toggle zoom to fit window or back to native size.
window.toggleZoom = function toggleZoom() {
	if (img.width==iw&&img.height==ih) {
		zoomToFit(img);
	}else{
        img.width = iw;
		img.height = ih;
		img.setAttribute("style","cursor:-moz-zoom-out");
  }
}

// Zoom an image to fit window.
function zoomToFit() {
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

if (document.images.length > 0){
    // Only works on first image.
    var img = document.images[0];
    var iw = img.width;
    var ih = img.height;
    var ir = iw / ih;

    // toggle zoom on click.
    img.addEventListener("click", () => { toggleZoom(img); }, false);
    img.setAttribute("style","cursor:-moz-zoom-in");
}
