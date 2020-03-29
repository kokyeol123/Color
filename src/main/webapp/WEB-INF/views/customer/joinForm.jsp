<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[id=addr1]").val(data.zonecode);
           $("[id=addr2]").val(fullRoadAddr);

           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

function formsubmit() {

	var addr1 = $("[id=addr1]").val()
	var addr2 = $("[id=addr2]").val()
	var addr3 = $("[id=addr3]").val()
	
	var custaddress = addr1 + " " + addr2 + " " + addr3

	$("[id=custaddress]").val(custaddress);
	
	var myForm = $("#join");
	myForm.submit();
}

// $(function() {
// 	$("#custid").on('keyup', function(){
// 		var custid = $('#custid').val();
// 		if(custid.trim().length < 3 || custid.trim().length > 5) {
// 			$("#idCheck").css("color", "red");
// 			$("#idCheck").text("아이디를 3~5자로 입력하세요");
// 			return;
// 		}
// 		$("#idCheck").text('');

// 		// 입력한 아이디가 사용가능한지 여부 체크
// 		$.ajax({
// 			type : "GET"
// 			, url : "idCheck"
// 			, data : {"custid" : custid}
// 			, success : function(resp) {
// 				// 사용가능한 경우 : 'success' 리턴
// 				// 사용불가능한 경우 : 'fail' 리턴
// 				if(resp == 'success') {
// 					$("#idCheck").css("color", "blue");
// 					$("#idCheck").text("사용 가능한 아이디입니다.");
// 				}
// 				else {
// 					$("#idCheck").css("color", "red");
// 					$("#idCheck").text("사용 불가능한 아이디입니다.");
// 				}
// 			}
// 		})
// 	})
// })
</script>
<script>
// function formCheck() {
// 	var id = document.getElementById("custid").value;
// 	if (id.trim().length < 3 || id.trim().length > 5) {
// 		alert("아이디를 3~5자 이내로 입력하세요");
// 		return false;
// 	}

// 	var pwd = document.getElementById("custpwd1").value;
// 	if (pwd.trim().length < 3 || pwd.trim().length > 5) {
// 		alert("비밀번호를 3~5자 이내로 입력하세요");
// 		return false;
// 	}

// 	var pwd2 = document.getElementById("custpwd2").value;
// 	if (pwd != pwd2) {
// 		alert("비밀번호가 일치하지 않습니다");
// 		return false;
// 	}

// 	var name = document.getElementById("custname").value;
// 	if (name.trim().length < 1) {
// 		alert("이름을 입력하세요");
// 		return false;
// 	}

// 	var email = document.getElementById("email").value;
// 	if (email.trim().length < 1) {
// 		alert("이메일을 입력하세요");
// 		return false;
// 	}

// 	if (email.indexOf("@") == -1) {
// 		alert("이메일을 양식에 맞게 입력하세요");
// 		return false;
// 	}
	
// 	var idno = document.getElementById("idno").value;
// 	if (idno.trim().length < 1) {
// 		alert("식별번호를 입력하세요");
// 		return;
// 	}

// 	var address = document.getElementById("address").value;
// 	if (address.trim().length < 1) {
// 		alert("주소을 입력하세요");
// 		return;
// 	}
// }

</script>
</head>
<body>
<div id="wrapper">
	<h2>[ 회원 가입 ]</h2>
	<c:url var="root" value="/" />
	<br />
	<a href="${root}">홈으로</a>
	<form id="join" action="join" method="POST">
		<table border="1">
			<tr>
				<th>고객 ID</th>
				<td>
					<input type="text" id="custid" name="custid" placeholder="아이디를 4~10자 이내로 입력하세요" />
					<span id="idCheck"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="custpwd1" name="custpwd" placeholder="비밀번호를 4~10자 이내로 입력하세요"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="custpwd2" placeholder="입력하신 비밀번호랑 일치하는 값을 입력하세요"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="custname" name="custname" placeholder="이름을 입력하세요"></td>
			</tr>
			<tr>
				<th>EMail</th>
				<td><input type="text" id="custemail" name="custemail" placeholder="Email을 입력하세요"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="custgender" value="male" checked="checked" />남자 &nbsp;
					<input type="radio" name="custgender" value="female" />여자 &nbsp;
				</td>
			</tr>
			<tr>
				<th>회원 구분</th>
				<td>
					<input type="radio" name="custage" value="0s" checked="checked" />10세 이하 &nbsp;
					<input type="radio" name="custage" value="10s" />11~20세 &nbsp;
					<input type="radio" name="custage" value="20s" />21~30세 &nbsp;
					<input type="radio" name="custage" value="30s" />31~40세 &nbsp;
					<input type="radio" name="custage" value="40s" />41~50세 &nbsp;
					<input type="radio" name="custage" value="50s" />51~60세 &nbsp;
					<input type="radio" name="custage" value="60s" />60세 이상 &nbsp;
				</td>
			</tr>
			<tr>
				<th>전화 번호</th>
				<td><input type="text" id="custphone" name="custphone" placeholder="010-0000-0000 형식으로 입력해주세요." /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<div>
						<input style="width: 40%; display: inline;" placeholder="우편번호" id="addr1" type="text" readonly="readonly" >
						<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
					</div>
					<div>
						<input style="top: 5px; width: 40%;" placeholder="도로명 주소" id="addr2" type="text" readonly="readonly" />
					</div>
					<div>
						<input style="top: 5px; width: 40%;" placeholder="상세주소" id="addr3" type="text" />
						<input type="hidden" id="custaddress" name="custaddress">
					</div>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="가입" onclick="formsubmit()" />
					<input type="reset" value="다시 쓰기" />
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

