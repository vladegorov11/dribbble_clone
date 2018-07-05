document.addEventListener("turbolinks:load", function() {
	var name = document.getElementById('name');
	//var description = document.getElementById('description');
	var skills = document.getElementById('skills');
	var showSkill  = document.getElementById('show-skills');
	var skillNew = [];

	$('#name').bind("input ", function() { 
		$('#show-name').text(name.value);
	});

	$('#description').bind("input ", function() { 
		$('#show-description').text(description.value);
	});

	$('#skills').bind("input ", function() {
		var skill = skills.value.split(',');
		for (var i = 0; i < skill.length; i++) {
   		skillNew[i] = "<span class='tag  is-size-7'>"+ skill[i] +"</span>";
		}
		showSkill.innerHTML = skillNew.join(' ');
		skillNew = [];
	});

	window.onscroll = function() {
  	var scrolled = window.pageYOffset || document.documentElement.scrollTop;
	  if (scrolled > 200) {
	  	
	  };
	};
});





