// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var excludeGrp = 0;
var addNestGrp = 0;
jQuery.ajaxSetup({
	'beforeSend': function(xhr){xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function(){
	//alert($('#groupTb tr').length);
	if (document.getElementById('addNesting') != null) {
		document.getElementById('addNesting').disabled = true;
	}
	$("#addNewNesting").click(function(){	
		alert(addNestGrp);
		$.ajax({
			url: '/group_nestings/new',
			type: 'get',
			data: {parant_id: 24, group_id: 35},
			success: function(){}
		});
		return true;
	})
});

function showMsg(id, elem){
	
	var m = elem.rowIndex;
	var oTable = document.getElementById('groupTb');
	var rows = oTable.getElementsByTagName('TR');
	excludeGrp = id;
	for (i=0; i<rows.length; i++){
		if (i % 2 != 0){
			rows[i].style.backgroundColor = "#CAE5EB";
		}
		else {
			rows[i].style.backgroundColor = "#FFFFFF";
		}
	}
	
	//alert("Row Index: " + m);
	elem.style.backgroundColor = 'yellow';
	
	alert(id);
	document.getElementById('addNesting').disabled = false;


}

function exGroup(){
	//alert(excludeGrp);
	
}
function getNesting(nid, nelem){
	//alert(nid);
	nelem.style.backgroundColor = 'yellow';
	addNestGrp = nid;
	
}

