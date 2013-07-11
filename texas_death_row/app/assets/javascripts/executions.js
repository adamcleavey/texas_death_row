// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  if ($('#do_the_math').length) {
    $("#do_the_math").on('click', function(){
      var DATE_EXECUTED = $('#date_executed_field').val();
      var DATE_RECIEVED = $('#date_received_field').val();
      var DATE_OF_BIRTH = $('#dob_field').val();
      var DATE_OFFENSE = $('#offense_date_field').val();
    });
  }
  if ($('#executions_index_table').length) {
    $executionTable = $("#executions_index_table").dataTable({
      "sDom": "<'row top-tools'<'span2'l><'span6 offset4'f>r><'row'>t<'row'<'span6'i><'span6'p>>",
      "sPaginationType": "bootstrap",
      "aaSorting": [[3, 'asc']],
      "sZeroRecords": "No matching records found",
      "sSearch": 0,
      "oLanguage": {
        "sLengthMenu": "_MENU_ Names per Page"
      }
    });
  } 
});
