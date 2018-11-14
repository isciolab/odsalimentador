/*
 *  Document   : tablesDatatables.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Tables Datatables page
 */

//
// Pipelining function for DataTables. To be used to the `ajax` option of DataTables
//


// Register an API method that will empty the pipelined data, forcing an Ajax
// fetch on the next draw (i.e. `table.clearPipeline().draw()`)
$.fn.dataTable.Api.register('clearPipeline()', function () {
    return this.iterator('table', function (settings) {
        settings.clearCache = true;
    });
});

var DatatablesSettings = {

    "language": {
        "emptyTable": "No se encontraron registros",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ resultados",
        "infoEmpty": "Mostrando 0 a 0 de 0 resultados",
        "infoFiltered": "(filtrado de _MAX_ total resultados)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ resultados",
        "loadingRecords": "Cargando...",
        "processing": "Buscando...",
        "search": "Búsqueda:",
        "zeroRecords": "No se encontraron resultados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        },
        "aria": {
            "sortAscending": ": activar ordenar columnas ascendente",
            "sortDescending": ": activar ordenar columnas descendente"
        }


    },
    "buttons": [
        {
            extend: 'pdfHtml5',
            extension: '.pdf',
            filename: 'ReportePDF',
            title: 'ODS',
            footer: true,
            exportOptions: {
                stripNewlines: false
            },
            orientation: 'landscape',
            pageSize: 'LEGAL',
            /*customize: function (doc) {
                doc.styles.title = {

                    alignment: 'center'
                }
            }*/

        },
        {
            extend: 'csv',
            extension: '.csv',
            filename: 'Reporte',
            footer: true

        },
        {
            extend: 'excelHtml5',
            extension: '.xlsx',
            filename: 'Reporte',
            footer: true,
            customize: function (xlsx) {
                console.log(xlsx);
                var sheet = xlsx.xl.worksheets['sheet1.xml'];
                var downrows = 3;
                var clRow = $('row', sheet);
                //update Row
                clRow.each(function () {
                    var attr = $(this).attr('r');
                    var ind = parseInt(attr);
                    ind = ind + downrows;
                    $(this).attr("r", ind);
                });

                // Update  row > c
                $('row c ', sheet).each(function () {
                    var attr = $(this).attr('r');
                    var pre = attr.substring(0, 1);
                    var ind = parseInt(attr.substring(1, attr.length));
                    ind = ind + downrows;
                    $(this).attr("r", pre + ind);
                });

                function Addrow(index, data) {
                    msg = '<row r="' + index + '">'
                    for (i = 0; i < data.length; i++) {
                        var key = data[i].k;
                        var value = data[i].v;
                        msg += '<c t="inlineStr" r="' + key + index + '" s="42">';
                        msg += '<is>';
                        msg += '<t>' + value + '</t>';
                        msg += '</is>';
                        msg += '</c>';
                    }
                    msg += '</row>';
                    return msg;
                }

            },
            exportOptions: {
                stripNewlines: true,
                columns: ':visible',
                format: {
                    body: function (data, row, column, node) {
                        data = $('<p>' + data + '</p>').text();
                        return $.isNumeric(data.replace(',', '.')) ? data.replace(',', '.') : data;
                    },
                    footer: function (data, row, column, node) {
                        // Strip $ from salary column to make it numeric
                        data = $('<p>' + data + '</p>').text();
                        return $.isNumeric(data.replace(',', '.')) ? data.replace(',', '.') : data;
                    }
                }
            }
        },


        'print',
        'copyHtml5'
    ],
    "dom": '<"row"<"pull-left"f ><"pull-right"l>>rt<"row"<"pull-left"i><"pull-right"p>><"row"<"pull-left"B>>',
};

var TablesDatatables = function () {

    return {
        init: function (orderby, datatable, order, title, footColums) {

            var botones_mstrar = DatatablesSettings.buttons;

            var oder_col = orderby || 0;
            var order_order = order || 'desc';


            if (title != undefined) {
                botones_mstrar[0].title = title;
                botones_mstrar[0].filename = title;
            }
            /* Initialize Datatables */

            if (datatable) {
                // console.log(datatable);
                datatable_elemnt = $('#' + datatable);
                //console.log(datatable_elemnt);
            }
            else {
                datatable_elemnt = $('.dataTable');
            }
            var table = datatable_elemnt.DataTable({
                    retrieve: true,

                    columnDefs: [
                        {width: '2%', targets: 0}
                    ],
                    "iDisplayLength": 20,
                    fixedColumns: false,
                    fixedHeader: {
                        header: true,
                        footer: false
                    },
                    "aLengthMenu": [[10, 20, 30, -1], [10, 20, 30, "Todos"]],
                    "order": [[oder_col, order_order]],
                    "scrollY": "300px",
                    "scrollX": true,
                    "scrollCollapse": true,
                    "dom": DatatablesSettings.dom,
                    buttons: botones_mstrar,
                    "language": DatatablesSettings.language,
                    "fnInitComplete": function () {

                        setTimeout(function () {
                            $('div.dataTables_filter input').focus();
                        }, 5);


                    },

                    "footerCallback": function (row, data, start, end, display) {
                        var api = this.api();


                        var i = 0;
                        api.columns().every(function (index) {

                            if (i > 0) {
                                var sum = this
                                    .data()
                                    .reduce(function (a, b) {

                                        var x = parseFloat(a) || 0;

                                        if (isNaN(x)) {
                                            x = 0;
                                        }
                                        //   console.log(x);
                                        // console.log(b);
                                        if (b != null) {
                                            if (isNaN(b)) {
                                                b = b.replace(/[,.]/g, function (m) {
                                                    // m is the match found in the string
                                                    // If `,` is matched return `.`, if `.` matched return `,`
                                                    return m === ',' ? '.' : '';
                                                });
                                            }

                                            // console.log(b);
                                            // b=parseFloat(b.replace('.','').replace(',','.'));
                                            var y = parseFloat(b) || 0;


                                            //  console.log(x + y);
                                            return x + y;
                                        }
                                    }, 0);


                                if (footColums == undefined) {
                                    footColums = [];
                                }
                                if (sum != undefined && $.inArray(index, footColums) != -1) {
                                    console.log(sum);
                                    console.log(index);
                                    $(this.footer()).html(sum.toLocaleString('de-DE', {
                                        maximumFractionDigits: 2,
                                        minimumFractionDigits: 2,
                                    }));
                                }

                            }
                            i++;


                        });


                    }

                })
            ;
            /* Add placeholder attribute to the search input */
            // $('.dataTables_filter input').attr('placeholder', 'Buscar');

            return table;
        }
    };
}();