// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var excludeGrp = 0;
var addNestGrp = 0;
function onload(){
	//alert($('#groupTb tr').length);
	if (document.getElementById('addNesting') != null) {
		document.getElementById('addNesting').disabled = true;
	}
}

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
function addNewNestings(){
	alert(excludeGrp);
	alert(addNestGrp);
	new Ajax.Request('/group_nesting/new?' + 'parent_id=3&'  + 'group_id=5' );
	
}
