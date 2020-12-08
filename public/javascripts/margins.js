window.onload = function setMargins() {
//	var container_size = document.getElementsByTagName("div")["main_container"].offsetWidth;
//	//document.document.getElementById("news_img").style.marginRight.marginRight;
//
//	var margins = container_size - 880;
//	if (margins < 0) {
//		margins = container_size - 660;
//		margins = margins/3;
//	} else {
//		margins = margins/4;
//	}
	
	var divs = document.getElementsByTagName("div");
	for (var i = 0; i < divs.length; i++) {
		 if ((divs[i].className == "block_220")||(divs[i].className == "column_220")) {
			 //divs[i].style.backgroundColor = "green";
			 //divs[i].style.marginRight = margins+"px";
			 //alert(divs[i].style);
		 }
		 if (divs[i].className == "visual_info_container") {
			 var wi = divs[i].offsetWidth;
			 //alert(wi);
		 }
	}
	
	//alert(margins);
}
