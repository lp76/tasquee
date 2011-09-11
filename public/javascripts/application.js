// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("select, input:text, textarea, input:checkbox, input:file").uniform();

  var customerTable = $('#customers');
  customerTable.dataTable({
    "bPaginate": true,
    "bSort": false,
    "aLengthMenu": [[10,25,50,-1],[10,25,50,"Tutti"]],
    "sDom": '<"top"lf>rt<"bottom"pi><"clear">',
    "sPaginationType": "full_numbers",
    "oLanguage": {
      "sProcessing":   "Caricamento...",
      "sLengthMenu":   "Visualizza _MENU_ elementi",
      "sZeroRecords":  "La ricerca non ha portato alcun risultato.",
      "sInfo":         "Vista da _START_ a _END_ di _TOTAL_ elementi",
      "sInfoEmpty":    "Vista da 0 a 0 di 0 elementi",
      "sInfoFiltered": "(filtrati da _MAX_ elementi totali)",
      "sInfoPostFix":  "",
      "sSearch":       "Cerca:",
      "sUrl":          "",
      "oPaginate": {
        "sFirst":    "Inizio",
        "sPrevious": "Precedente",
        "sNext":     "Successivo",
        "sLast":     "Fine"
      }
    }
  });

  $('#task_due').datepicker({dateFormat: 'dd-mm-yy'});
  $('#appointment_due').datepicker({dateFormat: 'dd-mm-yy'});
  $('#holiday_start_date').datepicker({dateFormat: 'dd-mm-yy'});
  $('#holiday_end_date').datepicker({dateFormat: 'dd-mm-yy'});

  $('.delete_action').live('ajax:success', function() {
    $(this).closest('tr').fadeOut();
  });

  $('#show_all_tasks').click(function() {
    $('tr.active').show();
    $('tr.completed').show();
    $('tr.pending').show();
  });

  $('#show_active_tasks').click(function() {
    $('tr.completed').hide();
    $('tr.pending').hide();
    $('tr.active').show();
  });

  $('#show_pending_tasks').click(function() {
    $('tr.active').hide();
    $('tr.completed').hide();
    $('tr.pending').show();
  });

  $('#show_completed_tasks').click(function() {
    $('tr.active').hide();
    $('tr.pending').hide();
    $('tr.completed').show();
  });

  $('#show_holidays').click(function() {
    $('#absences').hide();
    $('#holidays').show();
  });

  $('#show_absences').click(function() {
    $('#holidays').hide();
    $('#absences').show();
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

    $.uniform.update("select");

    $('#create_event').lightbox_me({
      centered: true,
      onClose: function() {
        $('label.error').remove();
      }
    });
    e.stopPropagation();
  });

  $('#create_event > #new_appointment').validate({
    errorPlacement: function(error, element) {
      error.appendTo(element.closest('div.input'));
    },
    submitHandler: function(form) {
      jQuery(form).ajaxSubmit( {
        resetForm: true,
        clearForm: true,
        dataType: 'script',
        success: function() {
          $('#create_event').trigger('close');
        }
      });
    }
  });

  $('#users').sortable({
    axis: 'y',
    dropOnEmpty: false,
    handle: '.handle',
    cursor: 'crosshair',
    items: 'li',
    opacity: 0.4,
    update: function() {
      $.ajax({
        type: 'post',
        data: $('#users').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('#users').effect("bounce", {times: 3, distance: 10}, 300);
        },
        url: '/events/sort'
      })
    }
  });

});
