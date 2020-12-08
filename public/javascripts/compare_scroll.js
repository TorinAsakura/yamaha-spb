var compare_table;
var rows, t1, t2;
var current_margin = 130;
var pixels_to_move = 0;
var direction = 0;
window.onload = function _onload() {
	compare_table = document.getElementById('compare_table');
	if (compare_table != undefined) {
		rows = compare_table.getElementsByTagName('ul');
	}
}
function scroll_left() {
	pixels_to_move -= 152;
	t1 = setTimeout('_scroll()', 200);
}
function scroll_right() {
	pixels_to_move += 152;
}
function _scroll() {
	//if (pixels_to_move == 0) {
	//} else {
		current_margin -= 1;
		for (var i=0; i < rows.length; i++) {
			rows[i].style.marginLeft = current_margin+"px";
		}
	//}
}