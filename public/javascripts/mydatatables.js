$(function() {
  var customersTable = $('#customers_table');
  customersTable.dataTable({
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

  var appointmentsTable = $('#appointments_table');
  appointmentsTable.dataTable({
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
});
