<%-- <%@page import="com.br.vo.Person"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ElBasic</title>
</head>
<body>
	<!-- <h3>1. 기존 방식 : 스크립틀릿과 표현식을 이용해서 scope에 담긴 데이터 꺼내서 화면에 출력</h3> -->
	
	<%-- <%
		String cRoom = (String) request.getAttribute("classRoom");
		Person stu = (Person) request.getAttribute("student");
		
		String aca = (String) session.getAttribute("academy");
		Person tea = (Person) session.getAttribute("teacher");
	%> 
	
	<p>
		getAttribute로 꺼낸 변수 출력해보기<br><br>
		학원명 : <%= aca %><br>
		강의장 : <%= cRoom %><br>
		강사 : <%= tea.getName() %>, <%= tea.getAge() %>, <%= tea.getGender() %>
		<br>
		
		학생 : <%= stu.getName() %>, <%= stu.getAge() %>, <%= tea.getGender() %>		
	</p> --%>
	
	<h3>2. EL을 이용해서 보다 쉽게 scope에 저장된 값들을 출력</h3>
	<p>
		EL 사용시 특정 scope로부터 값을 뽑을 때 키값 제시만으로 해당 attribute가 출력됨
		즉, 직접 자바코드로 getAttribute("키")를 실행시킬 필요없음
		뿐만 아니라 특정 객체의 필드에 담긴값을 뽑을 때도 필드명 제시만으로 해당 필드값이 출력된다
		즉, 직접 자바코드로 getter 메소드를 실행시킬 필요없음 
		(단, 내부적으로 getter 메소드가 실행되기 때문에 메소드가 정의되어있어야됨)
	</p>
	<p>
		학원명 : ${academy}<br>
		강의장 : ${classRoom}<br>
		강사 : ${teacher.name}, ${teacher.age}, ${teacher.gender}
		<!-- 
			teacher에 접근하면 Person 객체
			해당 Person 객체의 필드값을 출력하고자 한다면 .필드명으로 접근하면
			=> 내부적으로 getter 메소드 찾아져서 실행됨
			   (무조건 getter 메소드는 정의되어있어야됨!!)
		 -->
		<br>
		<!-- .필드명에 오타 있을 때 :
			 javax.el.PropertyNotFoundException: [nam] 특성이 [com.br.vo.Person] 유형에 없습니다.		
		 -->
		학생 : ${student.name}, ${student.age}, ${student.gender} 
	</p>
	
	<h3>3. 단 EL 사용시 JSP 내장객체들에 저장된 키값이 중복되이있을 경우</h3>
	<p>
		EL 사용시 별도로 scope를 제시하지 않을 경우
		모든 scope 탐색해서 찾아진 값을 출력해줌<br>
		탐색순서 : page => request => session => application<br>
		공유범위가 좁은 것에서부터 탐색<br>
		
		만일, 모든 영역에서 못 찾았을 경우 => 아무것도 출력이 안됨, 오류 발생하지 않음
	</p>
	학원위치 : ${location}<br>
	test값 : ${test}<br> <!-- 아무것도 출력되지 않음 -->
	test의 name값 : ${test.name} <!-- 아무것도 출력되지 않음 -->
	<!--  NullPointerException 안뜸 -->
	
	<h3>4. 직접 Scope 제시해서 값 가져오기</h3>
	<%
		// pageScope에 데이터 담기
		pageContext.setAttribute("location", "구로디지털단지역");
	%>
	PageScope : ${location} 또는 ${pageScope.location}<br>
	requestScope : ${requestScope.location}<br>
	sessionScope : ${sessionScope.location}<br>
	applicationScope : ${applicationScope.location}
</body>
</html>