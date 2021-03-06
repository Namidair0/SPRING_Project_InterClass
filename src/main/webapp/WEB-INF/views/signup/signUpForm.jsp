<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録</title>
</head>

<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
    body {
	    margin-top:20px;
	    background-color: #f2f3f8;
	}
	.card {
	    margin-bottom: 1.5rem;
	    box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
	}
	
	.card {
	    position: relative;
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-color: #fff;
	    background-clip: border-box;
	    border: 1px solid #e5e9f2;
	    border-radius: .2rem;
	}
</style>

<script>

//아이디 중복확인과 비밀번호 일치일 경우 sign up버튼 활성화를 위한 변수
var idCheck = 0;
var pwdCheck = 0;

//아이디 중복확인
function duplicatedId(){
	
	var mId = $("#mId").val()
	
	//아이디 미입력시 팝업
	if(mId.length == 0){
		alert('IDを入力してください。')
		return
	}
	
	//아이디 중복확인 버튼 클릭시
	//com.spring.validation 컨트롤러-서비스-dao
	$.ajax({
		url : '${root}signUp/duplicatedId/' + mId,
		type : 'get',
		dataType : 'text',
		success : function(result){
			if(result.trim() == 'true'){
				alert('使えるIDです。')
				$("#mIdExist").val('true')
				idCheck = 1;
			} else {
				alert('使えないIDです。')
				$("#mIdExist").val('false')
				idCheck = 0;
			}
		}
	})
}

//비밀번호 일치 불일치
function checkPwd() {
    var inputed = $('#mPwd').val();
    var reinputed = $('#mPwd2').val();
    
    //비밀번호 확인에 미입력 && 입력한 값이 불일치 하거나 일치할 경우
    //sign up 버튼 비활성화 지속(disabled,true)
    if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        $("#signupbtn").attr("disabled", "disabled");
        $("#mPwd2").css("background-color", "#FFCECE");
    }
    //공백x 비밀번호 일치시
    else if (inputed == reinputed) {
        $("#mPwd2").css("background-color", "#B0F6AC");
        pwdCheck = 1;
        
        //아이디중복확인 완료 + 비밀번호 일치 sign up 버튼 disabled 풀기(false)
        if(idCheck==1 && pwdCheck == 1) {
        	$("#signupbtn").removeAttr("disabled");
        }
    }
    
    //공백x 비밀번호 불일치시
    else if (inputed != reinputed) {
        pwdCheck = 0;
        $("#signupbtn").attr("disabled", "disabled");
        $("#mPwd2").css("background-color", "#FFCECE");
        
    }
}
</script>

<body>
<br>
<br>
	<div class="container text-center" onclick="location.href='<c:url value='/'/>'">
  			<h1>InterClass</h1>
	</div>
<br>
<br>
<hr>
<div class="container h-100">
 	<div class="row h-100">
		<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
			<div class="d-table-cell align-middle">

				<div class="text-center mt-4">
					<h3>会員登録</h3>
					<br>
				</div>

	<div class="card">
		<div class="card-body">
			<div class="m-sm-4">
				<form:form action="signUp" method="post" modelAttribute="memberVO">
					<div class="class-group">
						<label>ID</label>
					</div>
					<div class="input-group">
						<input class="form-control form-control-lg" type="text" name="mId" id="mId" onkeypress="resetDuplicatedId()" />
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" onclick='duplicatedId()'>ダブり検索</button>
						</div>
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mId') }" />
						</spring:hasBindErrors>
						<form:errors path="mId" style='color:red' />
					</div>
					<div class="form-group">
						<label>パスワード</label>
						<input class="form-control form-control-lg" type="password" name="mPwd" id="mPwd" required class="pass" oninput="checkPwd()" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mPwd') }" />
						</spring:hasBindErrors>
						<form:errors path="mPwd" style='color:red' />
					</div>
					<div class="form-group">
						<label>パスワード確認</label>
						<input class="form-control form-control-lg" type="password" name="mPwd2" id="mPwd2" required class="pass" oninput="checkPwd()" />
						<font id="chkNotice" size="2"> </font>
					</div>
					<div class="form-group">
						<label>氏名</label>
						<form:input class="form-control form-control-lg" type="text" path="mName"/>
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mName') }" />
						</spring:hasBindErrors>
						<form:errors path="mName" style='color:red' />
					</div>
					<div class="form-group">
						<label>性別</label>
						<form:select class="form-control form-control-lg" id="gender" path="mGender">
							<form:option value="남성">男性</form:option>
							<form:option value="여성">女性</form:option>
						</form:select>
					</div>
					<div class="form-group">
						<label>生年月日</label>
						<form:input class="form-control form-control-lg" type="text" path="mBirth" placeholder="例) 930329" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mBirth') }" />
						</spring:hasBindErrors>
						<form:errors path="mBirth" style='color:red' />
					</div>
					<div class="form-group">
						<label>Email</label>
						<form:input class="form-control form-control-lg" type="email" path="mEmail" placeholder="例) sping@test.com" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mEmail') }" />
						</spring:hasBindErrors>
						<form:errors path="mEmail" style='color:red' />
					</div>
					<div class="form-group">
						<label>TEL</label>
						<form:input class="form-control form-control-lg" type="text" path="mPhone" placeholder="例) 01012345678" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mPhone') }" />
						</spring:hasBindErrors>
						<form:errors path="mPhone" style='color:red' />
					</div>
					<br>
					<div class="text-center mt-3"> <!-- btn btn-lg btn-primary --> 
						<button type="submit" class="btn btn-lg btn-primary" id="signupbtn" disabled="disabled" >登録</button>
						<button type="button" class="btn btn-lg btn-primary" onclick="location.href='<c:url value="/" />'">キャンセル</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>		
			</div>
		</div>
	</div>
</div>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

</body>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>