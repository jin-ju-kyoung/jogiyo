<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비밀번호 찾기 결과 페이지 -->
<jsp:include page="../header.jsp"/>
<html>
<head>
	<title>비밀번호 찾기</title>
</head>
	<body>
		<form name="f" method="post" action="pw_find_result.do">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table width="600" align="center" class="outline">
			<td align="center">
				<h4>비밀번호 찾기</h4>
				<p>고객님과 일치하는 비밀번호 목록입니다.</p>
				<li>
				<strong>
				
				<input type="radio" name="select">
				<lable for="selcet0" class="label_rd">"${pw}"</lable>
					
				</strong>
				</li>
			</td>
			
			<tr>
			<td align="center">
			<button type="button" onclick="alert('로그인 페이지로 이동합니다.');
			window.location.href='login.do';">로그인</button>
			
			</td>
			</tr>
			
		</table>
		</form>
	</body>
</html>
<jsp:include page="../footer.jsp"/>