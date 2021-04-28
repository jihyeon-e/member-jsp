function checkWrite() {
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	if(document.writeForm.name.value=="") {
		document.getElementById("nameDiv").innerHTML = "<font color='red' size='2'><strong>이름을 입력하세요</strong></font>";
		document.writeForm.name.focus();
	} else if(document.writeForm.id.value=="") {
		document.getElementById("idDiv").innerHTML = "<font color='red' size='2'><strong>아이디를 입력하세요</strong></font>";
		document.writeForm.id.focus();
	} else if(document.writeForm.id.value != document.writeForm.check.value) {
        document.getElementById("idDiv").innerHTML = "<font color='red' size='2'><strong>아이디를 중복체크하세요</strong></font>";
	} else if(document.writeForm.pwd.value=="") {
		document.getElementById("pwdDiv").innerHTML = "<font color='red' size='2'><strong>비밀번호를 입력하세요</strong></font>";
		document.writeForm.pwd.focus();
	} else if(document.writeForm.pwd.value != document.writeForm.repwd.value) {
        document.getElementById("repwdDiv").innerHTML = "<font color='red' size='2'><strong>비밀번호가 일치하지 않습니다</strong></font>";
		document.writeForm.repwd.focus();
	} else document.writeForm.submit();
}


function checkId() {
	document.getElementById("idDiv").innerText = "";
	var id = document.writeForm.id.value;
	if(id=="") {
		document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요";
	} else {
		window.open("checkId.jsp?id="+id, "checkId", "width=450 height=150 left=900 top=200"); 
	}
}

function checkLogin() {
	if(document.loginForm.id.value=="") {
		alert("아이디를 입력하세요")
		document.loginForm.id.focus();
	} else if(document.loginForm.pwd.value=="") {
		alert("비밀번호를 입력하세요")
		document.loginForm.pwd.focus();
	} else document.loginForm.submit();
	
}

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