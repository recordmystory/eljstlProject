<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_functions</title>
</head>
<body>
	<h1>JSTL Functions Library</h1>
	
	<c:set var="str" value="How Are You?"/>
	
	str : ${str}<br>
	
	문자열의 길이 : ${str.length()}<br>
	문자열의 길이 : ${fn:length(str)}<br><br> <!-- List 또는 배열도 사용 가능 -->
	
	모두 대문자로 출력 : ${str.toUpperCase()}<br>
	모두 대문자로 출력 : ${fn:toUpperCase(str)}<br>

	모두 소문자로 출력 : ${str.toLowerCase()}<br>
	모두 소문자로 출력 : ${fn:toLowerCase(str)}<br><br>
	
	are의 시작인덱스 : ${str.indexOf("Are")}<br>
	are의 시작인덱스 : ${fn:indexOf(str, 'Are')}<br><br>
	
	are => Were 변경 : ${str.replace('are', 'Were')}<br>
	are => Were 변경 : ${fn:replace(str, 'Are', 'Were')}<br><br>
	
	문자열 추출 : ${str.substring(1, 5)}<br>
	문자열 추출 : ${fn:substring(str, 1, 5)}<br>
	
	<c:if test="${str.contains('Are')}">
		
	</c:if>
	
	<c:if test="${fn:containsIgnoreCase(str, 'are')}">
		대소문자 가리지 않고 are이 포함되어있음
	</c:if>
</body>
</html>