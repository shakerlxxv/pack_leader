$(document).ready(function(){
   // Your code here
    $(function() {
	    $( ".form_button" ).button({
		text: true
	    });
    });

    $(function() {
	    $( "#controls_nav" ).accordion({ header: 'a.menu', 
	   collapsible: true });
    });

});


