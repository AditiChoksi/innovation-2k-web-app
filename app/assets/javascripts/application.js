// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var eventMap;

$(function() {

	$.ajax({
		url : "/events.json",
		type : "GET",
		dataType : "json",

		success : function(data) {
			eventMap = data;
		},

		error : function() {
			console.log("Error in retrieving eventMap");
		}
	});
	
	$("#enrollment_event_name").prop("readonly",true);

	//To obtain the event_name of the event selected
	$(".evtBtn").click(function(e) {
		var evt_id = this.value;
		
		evtName = get_event_name(evt_id);
		$("#enrollment_event_name").val(evtName);
		
		evtAmt = get_reg_fees(evt_id);
		$("#enrollment_amt_paid").val(evtAmt);
	});

	function get_event_name(id) {
		for ( i = 0; i < eventMap.length; i++) {
			if (eventMap[i].id == id) {
				return eventMap[i].event_name;
			};
		}
	}
	
	function get_reg_fees(id) {
		for ( i = 0; i < eventMap.length; i++) {
			if (eventMap[i].id == id) {
				return eventMap[i].reg_fees;
			};
		}
	}
});
