	adimages = new Array("http://www.eads.com/adserve/adserve.dll/banner?GA08875,0,0","http://www.eads.com/adserve/adserve.dll/banner?GA08875,0,1","http://www.eads.com/adserve/adserve.dll/banner?GA08875,0,2","http://www.eads.com/adserve/adserve.dll/banner?GA08875,0,3")
	adurl = new Array("http://www.eads.com/adserve/adserve.dll/link?GA08875,0,0","http://www.eads.com/adserve/adserve.dll/link?GA08875,0,1","http://www.eads.com/adserve/adserve.dll/link?GA08875,0,2","http://www.eads.com/adserve/adserve.dll/link?GA08875,0,3")
	thisad = 0
	imgct = adimages.length

function rotate() {
	if (document.adbanner.complete) {
		thisad++
		if (thisad == imgct) { thisad = 0 }
		document.adbanner.src=adimages[thisad]
		}
	setTimeout("rotate()", 10 * 1000)		
}

function newlocation() {
	document.location.href = adurl + [thisad]
}
function showcontent(pageitem) {
	if (pageitem.style.display=="") { 
		pageitem.style.display="none";
		document.cookie = "pageitem=close;expires=" + expireDate.toGMTString();
	}
	else { 
		pageitem.style.display="";
		document.cookie = "pageitem=open;expires=" + expireDate.toGMTString();
	}
}