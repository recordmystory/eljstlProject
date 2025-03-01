<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_formatting</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<p>
		숫자데이터의 포맷(형식) 지정<br>
		표현하고자 하는 숫자데이터의 형식을 통화기호, % 등 원하는 쓰임에 맞게 형식을 지정하는 태그
		<br><br>
		
		(fmt:formatNumber value="출력할값" [groupingUsed="true|false" type="percent|currency" currencySymbol="통화기호문자"])
	</p>
	
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.75"/>
	<c:set var="num3" value="50000"/>
	
	출력 : ${num1}<br>
	세자리마다 구분해서 출력 : <fmt:formatNumber value="${num1}"/> <!-- groupingUsed 생략시 기본값 true : 세자리마다 구분자(,) 사용 -->
	<br>
	
	구분자없이 출력 : <fmt:formatNumber value="${num1}" groupingUsed="false"/>
	<!-- groupingUsed : 세자리마다 구분자(,) 표시 여부 지정 -->
	
	<br><br>
	
	percent : <fmt:formatNumber value="${num2}" type="percent"/><br>
	currency : <fmt:formatNumber value="${num3}" type="currency"/><br>
	currency : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="$"/>
	
	<!-- 
		type: 숫자를 출력할 형식을 지정 (percent, currency)
		currencySymbol: 통화기호문자 지정
	 -->
	 
	 <hr>
	 
	 <h3>2. formatDate</h3>
	 <p>날짜 및 시간 데이터의 포맷 지정 (단, java.util.Date 객체 사용)</p>
	 <c:set var="current" value="<%=new java.util.Date() %>"/>
	 
	 출력 : ${current}<br>
	 
	 현재 날짜 : <fmt:formatDate value="${current}"/><br> <!-- 2024.4.2. type 생략시 기본값이 date -->
	 현재 시간 : <fmt:formatDate value="${current}" type="time"/><br> <!-- 오전 11:11:34 -->
	 둘 다 : <fmt:formatDate value="${current}" type="both"/><br><br>
	 
	 <!-- Style 생략시 기본값이 medium -->
	 Medium : <fmt:formatDate value="${current}" type="both" dateStyle="medium" timeStyle="medium"/><br>
	 long : <fmt:formatDate value="${current}" type="both" dateStyle="long" timeStyle="long"/><br>
	 full : <fmt:formatDate value="${current}" type="both" dateStyle="full" timeStyle="full"/><br>
	 short : <fmt:formatDate value="${current}" type="both" dateStyle="short" timeStyle="short"/><br><br>
	 
	 <!-- 2024-04-02(화) 11:18:24(오전) -->
	 나만의 패턴 정의하기  : <fmt:formatDate value="${current}" type="both" pattern="yyyy-MM-dd(E) hh:mm:ss(a)"/><br>
	 
	 
</body> 
</html>