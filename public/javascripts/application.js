// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function load_form_container(url) {
	$.get('/forms/'+url, function(result) {
		$('#black_filter').after(result);
		$('#black_filter').show();
		$("#black_filter").css("height", $(document).height() + 600);
	});
}

function close_map() {
	$("#black_filter").hide();
	$(".form_container").hide();
}

function equip_submit() {

	var url = "";
	url = "/accessories/";
	
	$(".accessory_selector").each(function() {
		url += $(this).val() + "/";
	})
	if($('#vendor').val()) {
		url += '?vendor='+$('#vendor').val();
	}
    if (url != '/accessories//') {
	window.location.href = url;
    }
}

/*$(".accessory_selector").live("change", function() {
	var page_id = $(this).val();
	var index = $(".accessory_selector").index(this);
	var el = $(this);
	$(".accessory_selector:gt("+index+")").remove(); $('#vendor').remove();
	$.get("/equip/equip_types/"+page_id, function(result) {
		if(result) {
    	     el.after('<select class="accessory_selector"><option selected value="" disabled>Тип</option>'+result+'</select>');
	    } else {
			$.get("/equip/vendors/"+page_id, function(result) {
				el.after('<select id="vendor"><option value="" selected>Марка</option>'+result+'</select>');
			});
		}
	});
	
});*/

function accessory_select(el) {
	var page_id = el.value;
	var index = $(".accessory_selector").index(el);
	$(".accessory_selector:gt("+index+")").remove(); $('#vendor').remove();
	$.get("/equip/equip_types/"+page_id, function(result) {
		if(result) {
    	     $(el).after('<select class="accessory_selector" onchange="accessory_select(this);"><option selected value="" disabled>Тип</option>'+result+'</select>');
	    } else {
			$.get("/equip/vendors/"+page_id, function(result) {
				$(el).after('<select id="vendor"><option value="" selected>Марка</option>'+result+'</select>');
			});
		}
	});
}

$(document).ready(function() {

	$("#compare-buttons #scroll_prev").click(function() {
		$(".row ul").each(function() {
			$(this).css("margin-left", (parseInt($(this).css("margin-left")) - 140) + "px");
		});
		$("#compare-buttons #scroll_next").css("display", "block");
	});

	$("#compare-buttons #scroll_next").click(function() {
		$(".row ul").each(function() {
//			alert(parseInt($(this).css("margin-left")));
			
			$(this).css("margin-left", (parseInt($(this).css("margin-left")) + 140) + "px");
			if(parseInt($(this).css("margin-left")) == 0) { $("#compare-buttons #scroll_next").css("display", "none"); }
		});
//		$("#compare-buttons #scroll_next").css("display", "block");
	});

	$(".accessory_selector option:first").attr('selected', 'selected');	

	$(".equip_list li a").mouseover(function() {
		$(this).find("img").stop(true, true).fadeOut(500);
	});
	$(".equip_list li a").mouseout(function() {
		$(this).find("img").stop(true, true).fadeIn(500);		
	});

	//$("#datepicker").datepicker();
	$(".open_map").click(function() {
		$("#black_filter").removeClass("hidden");
		$("#black_filter").css("height", $(document).height() + 100);
		$(".form_container").removeClass("hidden");
	});
	
	$(".close_map").click(function() {
		$("#black_filter").addClass("hidden");
		$(".form_container").addClass("hidden");
	});
    //$(".gallery").scrollable();
	$(".salon").click(function(){
		$(".details").html("<a>Отдел запчастей</a>");
		$(this).html("<p>Салон</p>");
		$('#department').val('Салон');
	});
	$(".details").click(function() {
		$(this).html("<p>Отдел запчастей</p>")
		$(".salon").html("<a>Салон</a>");
		$('#department').val('Отдел запчастей');
	});
	
	$("#compare_show_form").click(function() {
		$(".container_w480").css("overflow", "visible");
	});
	$(".close_compare_form").click(function() {
		$(".container_w480").css("overflow", "hidden");
	});
	$(".catalog_nav a").mouseenter(function(){
	 //   $(".main_image").clearQueue();
	$(this).animate(100, $(".main_image").hide().attr("src", $(this).find("img").attr("src").replace("small_", "")).fadeIn(200));
//	$(".main_image").stop();
//		.fadeOut().fadeIn().animate({opacity: 1.0}, {queue: false});
	});
	$(".catalog_nav a").mouseleave(function(){
	//	$(this).animate(0, $(".main_image").hide().attr("src", $(this).find("img").attr("src").replace("small_", "")).fadeIn());
	});
	
	$("#main-image-buttons #scroll_left").click(function(){
			//$(".catalog_nav").css("left", "0px");
			$("#scroll_left").hide();
			$("#scroll_right").show();
			$(".menu_overflowed").hide();
			$(".menu_openflowed").fadeIn();
	});
	$("#main-image-buttons #scroll_right").click(function(){
			//setTimeout($(""))
			$(".menu_overflowed").fadeIn();
			$(".menu_openflowed").hide();
		//	$(".catalog_nav").animate(1000, $(this).css("left", "-184px"));
			$("#scroll_left").show();
			$("#scroll_right").hide();
	});
	
	$(".next").click(function() {
	//	setTimeout(500);
	});
	$(".prev").click(function() {
		
	});
	
	$(".gallery img").click(function() {
		var image = $(this);
		$(".gallery").html('');
		image.attr("src", image.attr("src").replace('thumb', 'preview'));
		image.addClass("big");
		$(".gallery").append(image);
	});

	   
	
});
