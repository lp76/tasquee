// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $('#task_due').datepicker({dateFormat: 'dd-mm-yy'});
  $('#appointment_due').datepicker({dateFormat: 'dd-mm-yy'});

  $('.delete_action').live('ajax:success', function() {
    $(this).closest('tr').fadeOut();
  });

  $('a.remote_link').live('mouseover', function() {
    $(this).click();
  });

  $('#events_calendar > tbody > tr > td').dblclick(function(e) {
    var info = $(this).attr('id').trim().split('_');
    var user = info[0];
    var day = info[1];
    var period = info[2];
    var user_id = $('#appointment_user_id option:contains(' + user + ')').val();

    $('#appointment_user_id').val(user_id);
    $('#appointment_due').val(day);
    $('#appointment_period').val(period);

    $('#create_event').dialog({
      modal: true,
      show: 'slide',
      width: 600,
      resizable: false,
      close: function(event, ui) {
        $('#new_appointment')[0].reset();
        $('#create_event').dialog('destroy');
      }
    });

    e.stopPropagation();
  });

  $('#new_appointment').submit(function() {
    $('#create_event').dialog('destroy');
  });

});
