<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
var phoneJ = /^\d{3}-\d{3,4}-\d{4}$/;
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
			$('#usercheck').attr("disabled",true);
			
		}else if($('#emp_no').val()!=''){
			
			var emp_no = $('#emp_no').val();
			$.ajax({
				async : true,
				type : 'POST',
				data : emp_no,
				url : '/emp/noCheck',
				dateType : 'json',
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					
					if(data > 0){
						$('#no_check').text('중복된 직원번호 입니다');
						$('#no_check').css('color','red');
						$('#usercheck').attr("disabled",true);
					}else{
						if(noJ.test(emp_no)){
							$('#no_check').text('사용가능한 직원번호 입니다');
							$('#no_check').css('color','blue');
							$('#usercheck').attr("disabled",true);
						}else if(emp_no==''){
							$('#no_check').text('직원번호를 입력해주세요');
							$('#no_check').css('color','red');
							$('#usercheck').attr("disabled",true);
						}else{
							$('#no_check').text('직원번호는 숫자 3자리만 가능합니다');
							$('#no_check').css('color','red');
							$('#usercheck').attr("disabled",true);
						}
					}
				}
				
			}); //ajax
		}//else if
		
	}); //blur
	
	$('form').on('submit',function(){
		var inval_Arr = new Array(4).fill(false);
		//직원번호 정규식
		if(noJ.test($('#emp_no').val())){
			inval_Arr[0] = true;
		}else{
			inval_Arr[0] = false;
			alert('직원번호를 확인하세요');
			return false;
		}
		//이름 정규식
		if(nameJ.test($('#emp_name').val())){
			inval_Arr[1] = true;
		}else{
			inval_Arr[1] = false;
			alert('이름을 확인하세요');
			return false;
		}
		//연락처 정규식
		if(phoneJ.test($('#emp_number').val())){
			console.log(phoneJ.test($('#emp_number').val()));
			inval_Arr[2] = true;
		}else{
			inval_Arr[2] = false;
			alert('연락처를 확인하세요');
			return false;
		}
		//이메일 정규식
		if(mailJ.test($('#emp_mail').val())){
			inval_Arr[3] = true;
		}else{
			inval_Arr[3] = false;
			alert('이메일을 확인하세요');
			return false;
		}
		
		//전체 유효성 검사
		var vaildAll = true;
		for(var i =0; i <inval_Arr.length; i++){
			if(inval_Arr[i] == false){
				vaildAll = false;
			}
		}
		//전체 유효성 통과
		if(validAll == true	){
			alert('직원등록이 성공적으로 완료되었습니다');
		}else{
			alert('정보를 다시 확인하세요');
		}
	});//form
	
	//밑에 유효성 텍스트 뜨게 하기
	//직원번호
	$('#emp_no').blur(function(){
		if(noJ.test($('#emp_no').val())){
			$("email_no").text('');
		}else{
			$('#email_no').text('3자리의 숫자만 쓰세요');
			$('#email_no').css('color','red');
		}
	});
	
	//이름
	$("#emp_name").blur(function(){
		if(nameJ.test($(this).val())){
			$("#name_check").text('');
		}else{
			$('#name_check').text('한글 2~4자 이내로 입력하세요(특수기호, 공백 사용 불가)');
			$('#name_check').css('color','red');
		}
	});
	
	//연락처
	$('#emp_number').blur(function(){
		if(phoneJ.test($(this).val())){
			$("number_check").text('');
		}else{
			$('#number_check').text('연락처 규정을 맞춰주세요');
			$('#number_check').css('color','red');
		}
	});
	
	//이메일
	$('#emp_email').blur(function(){
		if(mailJ.test($(this).val())){
			$("email_check").text('');
		}else{
			$('#email_check').text('이메일 규정을 맞춰주세요');
			$('#email_check').css('color','red');
		}
	});
	
	
});//전체
	
	









</script>


<title>직원 정보 등록</title>
</head>
<body>

	<h3>회원가입</h3>

	<div>
		<form action="insert" method="post" id="usercheck">
			<div>
				<label for="no">직원번호</label> <input type="text" name="emp_no"
					id="emp_no" placeholder="001">
				<div id="no_check"></div>
			</div>

			<div>
				<label for="name">이름</label> <input type="text" name="emp_name"
					id="emp_name" placeholder="홍길동">
				<div id="name_check"></div>
			</div>

			<div>
				<label for="number">연락처</label> <input type="text" name="emp_number"
					id="emp_number" placeholder="010-1234-5678">
				<div id="number_check"></div>
			</div>

			<div>
				<label for="email">이메일</label> <input type="text" name="emp_email"
					id="emp_email" placeholder="abc@naver.com">
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

