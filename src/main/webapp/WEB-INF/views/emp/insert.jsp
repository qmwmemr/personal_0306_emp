<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

//모든 공백 체크 정규식 
var empJ = /\s/g; 
//아이디 정규식 
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
// 비밀번호 정규식 
var pwJ = /^[A-Za-z0-9]{4,12}$/; 
// 이름 정규식 
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
// 이메일 검사 정규식 
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
//직원번호 정규식
var noJ = /^[0-9]{3}$/;

$(document).ready(function(){

	//직원번호 중복확인
	$("#emp_no").blur(function(){
		if($('#emp_no').val()==''){
			$('#no_check').text('직원번호를 입력해주세요');
			$('#no_check').css('color','red');
			
		} else if(noJ.test($('#emp_no').val())!=true){
			$('#no_check').text('3자리의 숫자만 사용가능합니다');
			$('#no_check').css('color','red');
			
		}else if($('#emp_no').val()!=''){
			
			var emp_no = $('#emp_no').val();
			$.ajax({
				
				
			}); //ajax
		}
		
		
	}); //blur
	
	
	
});








</script>


<title>직원 정보 등록</title>
</head>
<body>

	<h3>회원가입</h3>

	<div>
		<form action="insert" method="post">
			<div>
				<label for="no">직원번호</label> <input type="text" name="emp_no"
					id="emp_no" placeholder="직원번호">
				<div id="no_check"></div>
			</div>
			
			<div>
				<label for="name">이름</label> <input type="text" name="emp_name"
					id="emp_name" placeholder="이름">
				<div id="name_check"></div>
			</div>

			<div>
				<label for="number">연락처</label> <input type="text" name="emp_number"
					id="emp_number" placeholder="연락처">
				<div id="number_check"></div>
			</div>

			<div>
				<label for="email">이메일</label> <input type="text" name="emp_email"
					id="emp_email" placeholder="이메일">
				<div id="email_check"></div>
			</div>

			<div>
				<label for="position">직급</label> <select name="emp_position">
					<option value="과장">과장</option>
					<option value="부장">부장</option>
					<option value="사원">사원</option>
					<option value="인턴">인턴</option>
				</select>
				<div id="position_check"></div>
			</div>
			<div>
				<button type="submit">확인</button>
			</div>
		</form>
	</div>

</body>
</html>

