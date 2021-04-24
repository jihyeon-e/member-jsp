function checkBoard() {
	document.getElementById("subjectDiv").innerText="";
	document.getElementById("contentDiv").innerText="";
	
	if(document.getElementById("subject").value==""){
		document.getElementById("subjectDiv").innerHTML = "<font color='red' size='2'><strong>제목을 입력하세요</strong></font>";
	}else if(document.getElementById("content").value==""){
		document.getElementById("contentDiv").innerHTML = "<font color='red' size='2'><strong>내용을 입력하세요</strong></font>";
	} else {
		document.forms[0].submit();
	}
}