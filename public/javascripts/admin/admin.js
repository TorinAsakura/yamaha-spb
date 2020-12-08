$(document).ready(function(){
	$("input#ttx_group_title").autocomplete("auto_complete_for_ttx_group_title");
	$("input#ttx_title").autocomplete("auto_complete_for_ttx_title");
	//$("#container").tabs();
	//$(".container").tabs();
	$("input.colorpicked").ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	});

	
	$("#item-nested-forms").tabs();
	//$('.colorSelector').ColorPicker({flat: true});
	/*$('.colorSelector').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});*/
//	$("#buttons").corner();
//	$(".button").corner("8px");
//	$(".upload_button").corner("5px");
/*	$(".context-menu-show").click(function() {
		
	});
	$(".context-menu-hide").click(function() {
	
	})*/

});

function ttx_toggle(el) {
	$(el).parent('.ttx_div_add_group').find('.ttx_form_add_group').toggle();
}

function menu_show(el, id, type) {
	if(!type) type="page";
	$.get("/admin/pages/context_menu/"+id+"?type="+type, function(result) {
		$(".context-menu").html(result);
	});
	$(".context-menu").hide().show("slow").css("top", $(el).offset().top - 50).css("left", $(el).offset().left+50);
}

function menu_hide() {
	$(".context-menu").hide("slow");
}

$('.list li.child').live("mouseover", function() {
	$(this).find('img').attr('src', '/images/edit_over.gif')
});

$('.list li.child').live("mouseout", function() {
	$(this).find('img').attr('src', '/images/admin/pen_img.png')
});