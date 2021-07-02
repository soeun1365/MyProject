<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		idCheck();
		pwCheck();
		join();
	});
	
	// 회원가입함수
	function join(){
		$('#join_btn').click(function(){
			if ( !idPass ){
				alert('아이디를 확인하세요');
				return false;
			} else if ( !pwPass ) {
				alert('비밀번호를 확인하세요');
				return false;
			} else {
				$('#f').attr('action', 'join.do');
				$('#f').submit();
			}
		});
			
	}
	
	//아이디체크
	var idPass = false;
	function idCheck(){
		$('#id').keyup(function(){
			var regID = /^[a-z][a-zA-Z0-9]{4,9}$/;
			if (!regID.test($('#id').val())) {
				$('#idCheck').text('소문자로 시작하여 숫자를 포함한5~20자리 이어야합니다.').css('color','red');
				$('#id').focus();
				return false;
			}
			$.ajax({
				url: 'idCheck.do',
				type: 'get',
				data: 'id='+ $('#id').val(),
				dataType: 'json',
				success : function(resultMap){
					if(resultMap.count == 0){
						$('#idCheck').text('가입가능한 아이디 입니다.').css('color', 'green');
						idPass = true;
					} else {
						$('#idCheck').text('사용중인 아이디입니다.').css('color', 'red');
						idPass = false;
					}
				},
				error : function(){
					
				}
			});
		});
	}
	
	//비밀번호체크
	var pwPass = false;
	function pwCheck(){
		$('#pw1').keyup(function(){
			var regPW = /^[a-zA-Z0-9]{4,10}$/;
			if(!redPW.test($('#pw1').val())){
				$('#pw1Check').text('비밀번호는 대소문자, 숫자를 포함한 4~10자리 입니다').css('color', 'red');
				pwPass = false;
			} else {
				$('#pw1Check').text('사용가능한 비밀번호 입니다.').css('color', 'green');
				pwPass = true;
			}
		});
	}
	
</script>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="회원가입" name="title" />
</jsp:include>

	<form id="f">
		<table border="1">
			<thead>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td colspan="2" id="idCheck">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw1" id="pw1"></td>
				</tr>
				<tr>
					<td colspan="2" id="pw1Check"></td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
					<td><input type="password" id="pw2"></td>
				</tr>
				<tr>
					<td colspan="2" id="pw2Check"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td colspan="2" id="nameCheck"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<select name="phone1" id="phone1">
							<option value="010">010</option>
							<option value="010">011</option>
							<option value="010">016</option>
						</select> - 
						<input type="text" name="phone2" id="phone2" max="4"> - 
						<input type="text" name="phone3" id="phone3" max="4"></td>
				</tr>
				<tr>
					<td colspan="2" id="phoneCheck"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email">&nbsp;@&nbsp;
						<input type="text" list="domainList" name="domain" placeholder="도메인 입력/선택" value="">
						<datalist id="domainList">
							<option value="" />
							<option value="naver.com" />
							<option value="daum.net" />
							<option value="gmail.com" />
							<option value="nate.com" />
						</datalist>
					</td>	
				</tr>
				<tr>
					<td colspan="2" id="emailCheck"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address"></td>
				</tr>
				<tr>
					<td colspan="2" id="addressCheck"></td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" id="join_btn" value="회원가입">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	
<%@ include file="../layout/footer.jsp" %>