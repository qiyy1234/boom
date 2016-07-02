var oTable = $('#userdatatable').dataTable( {
    "sDom": "t<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
    searching:false,
    lengthChange:false,
   /* "createdRow": function ( row, data, index ) {
        if(index==1){
            $('td',row).css("color","red");
        }
    },*/
    "iDisplayLength": 5,
    "language": {
        url: 'public/internation/message_zh_CN.txt'
    },"columnDefs":[
        {
            "targets": 0,
            "render": function ( data, type, full, meta ) {
                return '<i class="fa fa-plus-square-o row-details"></i>';
            }
        }
    ]
} );

$('#userdatatable').on('click', ' tbody td .row-details', function () {
    var nTr = $(this).parents('tr')[0];
    if (oTable.fnIsOpen(nTr)) {
        /* This row is already open - close it */
        $(this).addClass("fa-plus-square-o").removeClass("fa-minus-square-o");
        oTable.fnClose(nTr);
    }
    else {
        /* Open this row */
        $(this).addClass("fa-minus-square-o").removeClass("fa-plus-square-o");;
        oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
    }
});

function fnFormatDetails(oTable, nTr) {

    var aData = oTable.fnGetData(nTr);
    var sOut = '<table>';
    sOut += '<tr><td rowspan="5" style="padding:0 10px 0 0;"><img width="120px" height="160px" src="assets/img/avatars/' + aData[4] + '.jpg"/></td><td>Name:</td><td>' + aData[1] + '</td></tr>';
    sOut += '<tr><td>Family:</td><td>' + aData[2] + '</td></tr>';
    sOut += '<tr><td>Age:</td><td>' + aData[3] + '</td></tr>';
    sOut += '<tr><td>Positon:</td><td>' + aData[4] + '</td></tr>';
    sOut += '<tr><td>Others:</td><td><a href="">Personal WebSite</a></td></tr>';
    sOut += '</table>';
    return sOut;
}
