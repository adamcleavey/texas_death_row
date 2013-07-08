(function( $ ) {
  $.fn.tableToJSON = function(opts) {

    // Set options
    var defaults = {
      ignoreColumns: [],
      onlyColumns: null,
      ignoreHiddenRows: true
    };
    opts = $.extend(defaults, opts);

    var notNull = function(value) {
      if(value !== undefined && value !== null) {
        return true;
      }
      return false;
    };

    var ignoredColumn = function(index) {
      if( notNull(opts.onlyColumns) ) {
        return $.inArray(index, opts.onlyColumns) === -1;
      }
      return $.inArray(index, opts.ignoreColumns) !== -1;
    };

    var arraysToHash = function(keys, values) {
      var result = {};
      $.each(values, function(index, value) {
        if( index < keys.length ) {
          result[ keys[index] ] = value;
        }
      });
      return result;
    };

    var rowValues = function(row) {
      var result = [];
      $(row).children("td,th").each(function(cellIndex, cell) {
        if( !ignoredColumn(cellIndex) ) {
          var override = $(cell).data("override");
          var value = $.trim($(cell).html());
          var newValue = value.replace("<a href=","")
                              .replace('title=\"Last Statement\">Last Statement</a>', "")
                              .replace(/>Last Statement<\/a>/g,"")
                              .replace('title=\"Offender Information\">Offender Information</a>', '')
                              .replace(/>Offender Information<\/a>/, "")
                              .replace('dr_info','http://www.tdcj.state.tx.us/death_row/dr_info')
                              .replace(/\\/g, "")
                              .replace(/"/g,"");
          result[ result.length ] = notNull(override) ? override : newValue;
        }
      });
      return result;
    };

    var getHeadings = function(table) {
      var firstRow = table.find("tr:first").first();
      return rowValues(firstRow);
    };

    var construct = function(table, headings) {
      var result = [];
      table.children("tbody,*").children("tr").each(function(rowIndex, row) {
        if( rowIndex !== 0 ) {
          if( $(row).is(":visible") || !opts.ignoreHiddenRows ) {
            result[result.length] = arraysToHash(headings, rowValues(row));
          }
        }
      });
      return result;
    };

    // Run
    var headings = getHeadings(this);
    return construct(this, headings);
  };
})( jQuery );