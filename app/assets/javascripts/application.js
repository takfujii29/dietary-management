// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require moment
//= require fullcalendar
//= require_tree .

$(function () {

  function eventCalendar() {
    return $('#calendar').fullCalendar({
    });
  };

  function clearCalendar() {
    $('#calendar').html('');
  };

  $('#calendar').fullCalendar({
    events: '/events.json'
  });
  
});

// dayClick: function(date, allDay, jsEvent, view) {
//   var title = prompt('予定を入力してください:');
  
//   $('#calendar').fullCalendar('addEventSource', [{
//   id:date,
//   title: title,
//   }]);
// };


// eventClick: function(event) {
//   var title = prompt('予定を更新してください:');
//   if(title &amp;&amp; title!=""){
//     event.title = title;
//     $('#calendar').fullCalendar('updateEvent', event);
//   }else{
//     $('#calendar').fullCalendar("removeEvents", event.id);
//     }
// };
