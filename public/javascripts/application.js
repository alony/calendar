// Ajax support class
jQuery.ajaxSetup({
  'beforeSend': function (xhr) {
   xhr.setRequestHeader("Accept", "text/javascript")
 }
});

jQuery.fn.submitWithAjax = function () {
  this.submit(function () {
   $.post($(this).attr("action"), $(this).serialize(), null, "script");
   return false;
  });
};

jQuery.fn.getWithAjax = function() {
  this.live ('click', function() {
    $.get($(this).attr("href"), $(this).parent().find(".hidden").serialize(), null, "script");
    return false;
  })
};

// new event dialog support class
var EventDialog = {

  init: function() {
    EventDialog._setupDialog();
  },

  _setupDialog: function() {

  // Init dialogs
  $("#event_dialog").dialog({
    autoOpen: false,
    modal: true,
    width: 350,
    title: 'Event'
    });
  }
};

// Bind
$(document).ready(function(){
  EventDialog.init();
  $("form.event").submitWithAjax();	
  $(".event_link").getWithAjax();
});
