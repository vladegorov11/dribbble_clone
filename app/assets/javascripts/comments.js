function isOpen(elemId , miniTextId) {
	let elem =  document.getElementById(elemId);
	let miniText =  document.getElementById(miniTextId);
	if ($(elem).css('display') == 'none') { 
	  $(miniText).animate({height: 'hide'}, 100);
      $(elem).animate({height: 'show'}, 500);
    }  else  { 
      $(miniText).animate({height: 'show'}, 300);   
      $(elem).animate({height: 'hide'}, 500);
	  } 
}