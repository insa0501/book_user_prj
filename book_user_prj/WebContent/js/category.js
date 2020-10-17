$(document).ready(function() {
    setBold();
}) //ready

function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), 
	results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function setBold() {
	var bookType = getParameterByName('type'); //파라메터 값
	
	if(bookType==null || bookType==''){
		bookType='all';
	}

	console.log("파라메터값 : "+ bookType); 

	$('#'+bookType).parent().addClass('selected');
}