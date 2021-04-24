function checkWrite() {
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	if(document.writeForm.name.value=="") {
		//alert("이름을 입력하세요")
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
		//document.writeForm.name.focus();
	} else if(document.writeForm.id.value=="") {
		//alert("아이디를 입력하세요")
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
		//document.writeForm.id.focus();
	} else if(document.writeForm.id.value != document.writeForm.check.value) {
        document.getElementById("idDiv").innerText = "아이디를 중복체크하세요";
	} else if(document.writeForm.pwd.value=="") {
		alert("비밀번호를 입력하세요")
		document.writeForm.pwd.focus();
	} else if(document.writeForm.pwd.value != document.writeForm.repwd.value) {
        alert("비밀번호가 맞지 않습니다")
		document.writeForm.repwd.focus();
	} else document.writeForm.submit();
}

function checkPost() {
	window.open("checkPost.jsp","checkPost","width=520 height=500 left=800 top=200 scrollbars=yes");
}

function checkModify() {
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";
	document.getElementById("repwdDiv").innerText = "";
	if(document.modifyForm.name.value=="") {
		document.getElementById("nameDiv").innerHTML="<font color='red' size='2'><strong>이름을 입력하세요</strong></font>";
	    document.modifyForm.name.focus();
	} else if(document.modifyForm.pwd.value=="") {
		document.getElementById("pwdDiv").innerHTML="<font color='red' size='2'<strong>비밀번호를 입력하세요</strong></font>";
	    document.modifyForm.pwd.focus();
	} else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value) {
		document.getElementById("repwdDiv").innerHTML="<font color='red' size='2'<strong>비밀번호가 일치하지 않습니다</strong></font>";
		document.modifyForm.repwd.focus();
	} else document.modifyForm.submit();
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

function checkLogin2(){
   document.getElementById("idDiv").innerText="";
   document.getElementById("pwdDiv").innerText="";
   
   if(document.loginForm.id.value==""){
   		document.getElementById("idDiv").innerHTML="<font color='red' size='2'><strong>아이디를 입력하세요</strong></font>";
   } else if(document.loginForm.pwd.value==""){
   		document.getElementById("pwdDiv").innerHTML="<font color='red' size='2'><strong>비밀번호를 입력하세요</strong></font>";
   } else{
       document.loginForm.submit();    
    }    
}

function checkId() {
	document.getElementById("idDiv").innerText = "";
	var id = document.writeForm.id.value;
	if(id=="") {
		//alert("먼저 아이디를 입력하세요");
		document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요";
	} else {
		window.open("checkId.jsp?id="+id, "checkId", "width=450 height=150 left=900 top=200"); 
											//중간 ""에 이름을 주면 창이 한번만 뜸
	}
}