<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_core</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수 (attribute)</h3>
	<pre>
		* 변수 선언과 동시에 초기화
		(c:set var="변수명" value="담고자하는값" [scope="어떤스코프에담을건지"]/)
		
		- 변수 선언하고 초기값을 대입해두는 기능을 제공
		(사실상 JSP 내장객체에 attribute로 담는 구문)
		- 해당 변수를 어떤 scope에 담을건지 지정 가능함 (생략시 기본적으로 pageScope)
		- 즉, 특정 scope에 setAttribute를 통해서 key-value 형태로 데이터 담는 구문
		- c:set으로 선언된 변수는 EL을 이용해서 꺼내 사용 (스크립팅 원소로는 접근 불가)
		
		* 주의사항
		- 변수의 타입을 별도로 지정하지 않음
		- 초기값을 반드시 지정해야됨!

		
		=> XXX스코프.setAttribute("var변수", "value값");
	</pre>
	
	<c:set var="num1" value="10"/><!--pageContext.setAttribute("num1", "10");-->
	<c:set var="num2" value="20" scope="request"/> <!-- request.setAttribute("num2", "20"); -->

	num1 값 : ${num1}<br>
	num2 값 : ${num2}<br>
	
	<c:set var="result" value="${num1 + num2}" scope="session"/>
	<br><br>
	result 값 : ${result}<br>
	${pageScope.num1}<br>
	${requestScope.num2}<br>
	${requestScope.result}<br>
	${sessionScope.result}<br><br>
	
	<!-- value 속성 대신에 시작태그와 종료태그에 초기값 지정 가능 -->
	<c:set var="result" scope="request">999</c:set>
	${requestScope.result}
	
	<hr>
	
	<pre>
		* 변수 삭제 (c:remove var="제거하고자하는변수명" [scope=""]/)
		- 해당 scope영역에서 해당 변수를 찾아서 제거하는 태그
		- scope 지정 생략시 모든 scope로부터 다 찾아져서 제거
		- 즉, 해당 scope에 .removeAttribute("변수")를 통해 제거
	</pre>
	
	삭제전 result : ${result}
	
	<c:remove var="result" scope="request"/>
	
	삭제후 result : ${result}<br>
	
	<c:remove var="result"/>
	전체삭제후 result : ${result}
	
	<hr>
	
	<pre>
		* 변수(데이터) 출력 (c:out value="출력하고자하는값" [default="기본값"] [escapeXml="true|false"])
		- 데이터를 출력하고자 할 때 사용하는 태그
	</pre>
	
	result 값 : <c:out value="${result}" default="없음"/><br>
	
	<c:set var="test" value="<b>출력테스트</b>"/>
	test 값 : <c:out value="${test}" default="없음"/> <!-- escpaeXml 속성 생략시 기본값 true 태그로써 해석 안됨(문자열로 취급) --><br>
	test 값 : <c:out value="${test}" default="없음" escapeXml="false"/> 
	
	<hr>
	
	<h3>2. 조건문 - if (c:if test="조건식")</h3>
	<pre>
		- JAVA의 단일 if문과 비슷한 역할을 하는 태그 (단, EL 구문으로 기술해야됨)
	</pre>
	<%-- 
	<%if(num1 > num2){%>
		<b>num1이 num2보다 큽니다.</b>
	<% } %> 
	--%>
	<c:if test="${num1 gt num2}">
		<b>num1이 num2보다 큽니다.</b>
	</c:if>
	
	<c:if test="${num1 le num2}">
		<b>num1이 num2보다 작거나 같습니다.</b>
	</c:if>
</body>
</html>