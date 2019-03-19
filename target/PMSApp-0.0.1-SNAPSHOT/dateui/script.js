$(document).ready(
  
  /* This is the function that will get executed after the DOM is fully loaded */
  function () {
	  $( "#date" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  minDate: -0,
		  defaultDate: +0,
		  changeMonth: true,//this option for allowing user to select month
	      changeYear: true, //this option for allowing user to select from year range	 
	    });
	  $( "#dateto" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  minDate: -0,
		  defaultDate: +0,
		  changeMonth: true,//this option for allowing user to select month
	      changeYear: true, //this option for allowing user to select from year range
		  maxDate:+30,
		  onClose: function(selectedDate) {
			  $("#datefrom").datepicker("option","minDate", selectedDate)
		  }
	    });
	     $( "#datefrom" ).datepicker({
	      dateFormat: 'yy-mm-dd',
		  minDate: -0,
		  defaultDate: +0,
		  changeMonth: true,//this option for allowing user to select month
	      changeYear: true, //this option for allowing user to select from year range
		  maxDate:+60,
		  
		});
	    
     }

);