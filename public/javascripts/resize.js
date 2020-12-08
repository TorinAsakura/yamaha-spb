var max_width = 940;
var min_width = 757;
var container;
var body_width;
var models_list;
var black_filter;

window.onload = function _onload() {
	//устанавливаем преременные
	black_filter = document.getElementById('black_filter');
	container = $('#main_container');
	if (document.getElementById('models_list_container') != null) {
		models_list = document.getElementById('models_list_container');
		models_list = models_list.getElementsByTagName('li');
	}
	resize_container();
	if (black_filter != undefined) resize_filter();
	if (models_list != undefined) models_list_fix(container.offsetWidth);
	//alert(document.body.offsetHeight);
	//alert(document.body.scrollHeight);
	//alert(window.scrollMaxX);
}
window.onresize = function _onresize() {
	resize_container();
	if (models_list != undefined) models_list_fix(container.offsetWidth);
	//растягиваем черный фильтр на весь экран
	if (black_filter != undefined) resize_filter();
}

function resize_container() {
	var container = $("#main_container");
	body_width = document.body ? document.body.offsetWidth : $("body").offsetWidth;
	if (body_width < max_width) {
		if (body_width > min_width) {
			$("#scroll_right").show();
			$(".menu_overflowed").hide();
			//container.style.width = body_width+"px";
			container.css("width", "759px");
		} else {
			$(".menu_overflowed").hide();
			$(".menu_openflowed").show();
			container.css("width", "759px");
			$("#scroll_right").show();
		}
	} else {
		$(".menu_overflowed").show();
		$(".menu_openflowed").show();
		$("#scroll_left").hide(); $("#scroll_right").hide();
		container.css("width", max_width+"px");
	}
}
function resize_filter() {
	black_filter.style.height = getDocumentHeight()+"px";
	black_filter.style.width = getDocumentWidth()+"px";
}

function models_list_fix(container_width) {
	if (container_width < max_width) {
		//устанавливаем отступ
		var margin = ((container_width-30)-(models_list[0].offsetWidth * 4))/3;
		for (var i=0; i < models_list.length; i++) {models_list[i].style.marginRight = margin+'px';}
		
		//делаем переносы
		for (var i=1; i < models_list.length; i++) {
			if ((i%3) == 0) {models_list[i].style.marginRight = 0+'px';}
			if ((i%4) == 0) {
				models_list[i].className = 'clear';
			}
			if ((i%5) == 0) {
				models_list[i].className = 'left';
			}
		}
	} else {
		for (var i=0; i < models_list.length; i++) {models_list[i].style.marginRight = '35px';}
		for (var i=1; i < models_list.length; i++) {
			if ((i%4) == 0) { models_list[i].className = 'left'; models_list[i].style.marginRight = 0+'px';}
			if ((i%5) == 0) models_list[i].className = 'clear';
		}
	}
}

var ua = navigator.userAgent.toLowerCase();
var isOpera = (ua.indexOf('opera')  > -1);
var isIE = (!isOpera && ua.indexOf('msie') > -1);
 
function getDocumentHeight() {
	return Math.max(document.compatMode != 'CSS1Compat' ? document.body.scrollHeight : document.documentElement.scrollHeight, getViewportHeight());
}
function getViewportHeight() {
	return ((document.compatMode || isIE) && !isOpera) ? (document.compatMode == 'CSS1Compat') ? document.documentElement.clientHeight : document.body.clientHeight : (document.parentWindow || document.defaultView).innerHeight;
}
function getDocumentWidth() {
	var ff_scroll_x = 0;
	if (window.scrollMaxY != undefined) {
		ff_scroll_x = window.scrollMaxX;
	}
	return (document.body.scrollWidth+ff_scroll_x);
}
