// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $('#task_due').datepicker({dateFormat: 'dd-mm-yy'});
  $('#appointment_due').datepicker({dateFormat: 'dd-mm-yy'});

  $('.delete_action').live('ajax:success', function() {
    $(this).closest('tr').fadeOut();
  });

  $('#show_all_tasks').click(function() {
    $('#active_tasks').hide();
    $('#completed_tasks').hide();
    $('#pending_tasks').hide();
    $('#all_tasks').show();
  });

  $('#show_active_tasks').click(function() {
    $('#all_tasks').hide();
    $('#completed_tasks').hide();
    $('#pending_tasks').hide();
    $('#active_tasks').show();
  });

  $('#show_pending_tasks').click(function() {
    $('#all_tasks').hide();
    $('#active_tasks').hide();
    $('#completed_tasks').hide();
    $('#pending_tasks').show();
  });

  $('#show_completed_tasks').click(function() {
    $('#all_tasks').hide();
    $('#active_tasks').hide();
    $('#pending_tasks').hide();
    $('#completed_tasks').show();
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
        $('#new_appointment').resetForm();
        $('#create_event').dialog('destroy');
      }
    });

    e.stopPropagation();
  });

  $('#create_event > #new_appointment').validate({
    submitHandler: function(form) {
      jQuery(form).ajaxSubmit( {
        resetForm: true,
        clearForm: true,
        dataType: 'script',
        success: function() {
          $('#create_event').dialog('destroy');
        }
      });
    }
  });
});
