var max_width = 940;
var min_width = 757;
window.onload = resize;
window.onresize = resize;
function resize() {
	var container = document.getElementById('main_container');
	var body_width = document.body.offsetWidth;
	if (body_width < max_width) {
		if (body_width > min_width) {
			$("#scroll_left").hide(); $("#scroll_right").hide();
			container.style.width = body_width+"px";
		} else {
			container.style.width = min_width+"px";
			$("#scroll_left").show(); $("#scroll_right").show();
		}
	} else {
		container.style.width = max_width+"px";
	}
	//document.getElementById('qwe').innerHTML = "body: "+body_width+"<br />container: "+container.offsetWidth;
	
}