<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<h3>jsp:include</h3>
	<p>또다른 페이지를 포함하고자 할때 쓰는 태그</p>
	
	<h4>1. 기존방식 : include 지시어를 이용한 방식 (정적 include 방식 == 컴파일시 애초에 포함되어있는 형태)</h4>
	
	특징 : include 하고 있는 페이지상에 선언되어있는 변수를 현재 페이지에서도 이어서 사용 가능<br><br>
		  단, 현재 이 페이지에서 동일한 이름의 변수를 재선언할 수 없음
		  
<%-- 	
    <%@ include file="/views/02_standardAction/footer.jsp" %>
	현재년도 : <%=year%>년<br>
	<% int year = 2024; %> <!-- 재선언 불가 --> 
--%>
	
	<h4>2. JSP 표준액션 태그를 이용한 방식 (동적 include 방식 == 런타임시 포함되는 형태)</h4>
	<jsp:include page="/views/02_standardAction/footer.jsp"/>
	
	특징 1 : include 하고 있는 페이지에 선언된 변수를 공유하지 않음<br>
	=> 동일한 이름의 변수로 재선언 가능 <br><br>
	<%-- 현재년도 : <%=year%>년<br> --%>
	<% int year = 2024; %> <!-- 재선언 가능하다는 점이 장점 -->
	
	특징 2 : 해당 그 페이지를 포함할 때 include 하는 페이지로 값 전달할 수 있음<br>
	<jsp:include page="/views/02_standardAction/footer.jsp">
		<jsp:param value="test1" name="test"/>
	</jsp:include>
	
	<jsp:include page="/views/02_standardAction/footer.jsp">
		<jsp:param value="test2" name="test"/>
	</jsp:include>
</body>
</html>