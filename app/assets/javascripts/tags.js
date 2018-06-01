function showTags() {
 if ($("div#tag-cloud-container").css('display') == 'none') { 
      $("div#tag-cloud-container").animate({height: 'show'}, 500);
      $('#arrow').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
    }  else  {     
      $("div#tag-cloud-container").animate({height: 'hide'}, 500);
      $('#arrow').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
	  } 
}