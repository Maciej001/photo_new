var dropdown_visible = false;
var menu_visible = false;

dropdownToggle = function(){
	var clicked_item = $("a:contains('Account')");
	var dropdown_menu = $('.submenu-wrapper');	

	if(dropdown_menu.is(':visible')) {
		clicked_item.removeClass('menu-active');
	}	else {
		clicked_item.addClass('menu-active');
	}

	dropdown_menu.slideToggle('slow');
};

mobileMenuToggle = function() {
	var dropdown_menu = $('.submenu-wrapper');

	if(dropdown_menu.is(':visible')) {
		dropdown_menu.hide('slow');
		$("a:contains('Account')").removeClass('menu-active');
	} 

	if($('.menu-container').is(':visible')) {
		$('.menu-icon').removeClass('menu-icon-active');
	} else {
		$('.menu-icon').addClass('menu-icon-active');
	}

	$('.menu-container').slideToggle('slow');
}


$(document).on('click', "a:contains('Account')", dropdownToggle);
$(document).on('click', ".menu-icon", mobileMenuToggle);


// Wyswietla menu przy zwiekszaniu okna od mobile z ikonka menu
// do pelnego okna
// 
// !!! Nadal nie dziala po rozwinieciu i zwinieciu okna mobile menu
// a nastepnie rozszerzeniu okna

$(window).resize(function(){
	if($('menu-icon').is(':hidden')) {
		$('.menu-container').css('display','block');
	}
});