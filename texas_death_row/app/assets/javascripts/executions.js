$(document).ready(function() {
  var DATE_EXECUTED = new Date($('#date_executed_field').val());
  var DATE_RECEIVED = new Date($('#date_received_field').val());
  var DATE_OF_BIRTH = new Date($('#dob_field').val());
  var DATE_OFFENSE = new Date($('#offense_date_field').val());
  
  $("#do_the_math").on('click', function(){
    console.log(DATE_EXECUTED + " " + DATE_RECEIVED + " " + DATE_OF_BIRTH + " " + DATE_OFFENSE + " ");
    //Days between received and executed
    var DAYS_BETWEEN_RECD_EXEC = (DATE_EXECUTED - DATE_RECEIVED) / (1000 * 3600 * 24);
    $('#computed_days_between_received_and_executed_field').val(DAYS_BETWEEN_RECD_EXEC);
    //days between offense and received
    var DAYS_BETWEEN_OFF_REC = (DATE_RECEIVED - DATE_OFFENSE) / (1000 * 3600 * 24);
    $('#computed_days_before_received_after_offense_field').val(DAYS_BETWEEN_OFF_REC);
    //exact age at offense
    var EXACT_AGE_OFF = (DATE_OFFENSE - DATE_OF_BIRTH) / (1000 * 3600 * 24 * 365.25);
    $('#computed_age_at_offense_field').val(EXACT_AGE_OFF);
    //exact age executed
    var EXACT_AGE_EXEC = (DATE_EXECUTED - DATE_OF_BIRTH) / (1000 * 3600 * 24 * 365.25);
    $('#computed_age_executed_field').val(EXACT_AGE_EXEC);
    //exact age received
    var EXACT_AGE_REC = (DATE_RECEIVED - DATE_OF_BIRTH) / (1000 * 3600 * 24 * 365.25);
    $('#computed_age_recieved_field').val(EXACT_AGE_REC);
  });
  
  if ($('#executions_index_table').length) {
    var $executionTable = $("#executions_index_table").dataTable({
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
