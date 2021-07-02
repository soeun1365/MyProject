<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		idCheck();
		pwCheck();
		pwCheck2();
		nameCheck();
		phoneCheck();
		emailCheck();
		addressCheck();
		join();
	});
	
	// 회원가입함수
	function join(){
		$('#join_btn').click(function(){
			if(!idPass){
				alert('아이디를 확인하세요');
				return false;
			}else if(!pwPass){
				alert('비밀번호를 확인하세요');
				return false;
			}else if(!pw2Pass){
				alert('비밀번호 재확인하세요.');
				return false;
			}else if(!namePass){
				alert('이름을 확인하세요.');
				return false;
			}else if(!emailPass){
				alert('이메일을 확인하세요.');
				return false;
			}else if(!addressPass){
				alert('주소를 확인하세요.');
				return false;
			}else{
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
					if(resultMap.count != 0){
						$('#idCheck').text('사용중인 아이디입니다.').css('color', 'red');
						idPass = false;
					}else{
						$('#idCheck').text('가입가능한 아이디 입니다.').css('color', 'green');
						idPass = true;
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
			var regPW = /^(?=.*[A-Z])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,8}$/;
			if(!regPW.test($('#pw1').val())){
				$('#pw1Check').text('비밀번호는 대문자와 특수문자를 포함한 4~8자리 이어야합니다.').css('color', 'red');
				pwPass = false;
			}else{
				$('#pw1Check').text('사용가능한 비밀번호 입니다.').css('color', 'green');
				pwPass = true;
			}
		});
	}
	
	//비밀번호 재확인
	var pw2Pass = false;
	function pwCheck2(){
		$('#pw2').keyup(function(){
			if( $('#pw1').val() != $('#pw2').val()){
				$('#pw2Check').text('비밀번호 재확인이 필요합니다.').css('color', 'red');
				pw2Pass = false;
			}else{
				$('#pw2Check').text('비밀번호가 재확인 되었습니다.').css('color', 'green');
				pw2Pass = true;
			}
		});
	}
	
	//이름 확인
	var namePass = false;
	function nameCheck(){
		$('#name').keyup(function(){
			var regName = /^[가-힣a-zA-Z]{2,5}$/;
			if(!regName.test($('#name').val())){
				$('#nameCheck').text('이름을 확인해주세요.').css('color', 'red');
				namePass = false;
			}else{
				$('#nameCheck').text('이름이 입력되었습니다.').css('color', 'green');
				namePass = true;
			}
		});
	}
	
	//전화번호확인
	var phonePass = false;
	var regPhone2 = /^[0-9]{3,4}$/;
	var regPhone3 = /^[0-9]{4}$/;
	function phoneCheck(){
		$('#phone2').keyup(function(){
			if(!regPhone2.test($('#phone2').val()) || !regPhone3.test($('#phone3').val())){
				phonePass = false;
				$('#phoneCheck').text('전화번호를 확인해주세요').css('color', 'red');
			}else if(regPhone2.test($('#phone2').val()) && regPhone3.test($('#phone3').val())){
				phonePass = true;
				$('#phoneCheck').text('전화번호가 입력되었습니다.').css('color', 'green');
			}
		});
		$('#phone3').keyup(function(){
			if(!regPhone2.test($('#phone2').val()) || !regPhone3.test($('#phone3').val())){
				phonePass = false;
				$('#phoneCheck').text('전화번호를 확인해주세요').css('color', 'red');
			}else if(regPhone2.test($('#phone2').val()) && regPhone3.test($('#phone3').val())){
				phonePass = true;
				$('#phoneCheck').text('전화번호가 입력되었습니다.').css('color', 'green');
			}
		});
	}
	

	//이메일확인
	var emailPass = false;
	function emailCheck(){
		$('#email').keyup(function(){
			if($('#email').val() == ''){
				$('#emailCheck').text('이메일을 입력해주세요.').css('color', 'red');
				emailPass = false;
			}else{
				$('#emailCheck').text('이메일이 입력되었습니다.').css('color', 'green');
				emailPass = true;
			}
		});
	}
	//도메인 확인
	var domainPass = false;
	function domainCheck(){
		$('#domain').click(function(){
			if($('#domain').val() == ''){
				$('#emailCheck').text('도메인 입력/선택 해주세요.');
				domainPass = false;
			}else{
				$('#emailCheck').text('도메인이 입력되었습니다.');
				domainPass = true;
			}
		})
	}
	
	//주소확인
	var addressPass = false;
	function addressCheck(){
		$('#address').keyup(function(){
			if($('#address').val() == ''){
				$('#addressCheck').text('주소를 확인하세요.').css('color', 'red');
				addressPass = false;
			}else{
				$('#addressCheck').text('주소가입력되었습니다.').css('color', 'green');
				addressPass = true;
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
				<td colspan="2">*는 필수 입력 요소입니다.</td>
				</tr>
				<tr>
					<td>아이디*</td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td colspan="2" id="idCheck">
					</td>
				</tr>
				<tr>
					<td>비밀번호*</td>
					<td><input type="password" name="pw1" id="pw1"></td>
				</tr>
				<tr>
					<td colspan="2" id="pw1Check"></td>
				</tr>
				<tr>
					<td>비밀번호 재확인*</td>
					<td><input type="password" id="pw2"></td>
				</tr>
				<tr>
					<td colspan="2" id="pw2Check"></td>
				</tr>
				<tr>
					<td>이름*</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td colspan="2" id="nameCheck"></td>
				</tr>
				<tr>
					<td>전화번호*</td>
					<td>
						<select name="phone1" id="phone1">
							<option value="010">010</option>
							<option value="010">011</option>
							<option value="010">016</option>
						</select> - 
						<input type="text" name="phone2" id="phone2" maxlength="4"> - 
						<input type="text" name="phone3" id="phone3" maxlength="4"></td>
				</tr>
				<tr>
					<td colspan="2" id="phoneCheck"></td>
				</tr>
				<tr>
					<td>이메일*</td>
					<td><input type="text" name="email" id="email">&nbsp;@&nbsp;
						<input type="text" list="domainList" name="domain" placeholder="도메인 입력/선택" id = "domain">
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