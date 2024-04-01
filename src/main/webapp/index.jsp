<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index 페이지</title>
</head>
<body>
	<h1>* EL(Expression Language) 표현언어</h1>
	<p>
		기존에 사용했던 표현식(출력식) &lt;%= name %&gt;와 같이<br>
		jsp 상에 표현하고자 하는 값을 \${ name }의 형식으로 표현해서 작성하는 것<br>
		jsp 내장객체에 담겨있는 attribute 값들을 보다 쉽게 꺼내서 화면에 출력시켜줄 수 있음
	</p>
	
	<a href="${pageContext.servletContext.contextPath}/el.do">01_EL의 기본 구문</a><br>
	<a href="${pageContext.servletContext.contextPath}/operation.do">02_EL의 연산자</a>
	
	<!-- 
		* JSP를 이루는 구성인자
		1. 스크립팅 원소 : jsp에서 자바코드를 직접 기술할 수 있게 하는 기능
					   ex) 스크립틀릿, 표현식(출력식), 선언문 등
					   
		2. 지시어 : jsp 페이지 정보를 표현하거나 
				  또다른 jsp를 포함할 때 
				  jsp 기능을 확장시켜주는 라이브러리 등록할 때도 사용
				  ex) page 지시어, include 지시어, taglib 지시어
				  
	    3. 액션태그(표준액션태그, 커스텀액션태그) : xml 기술을 이용해서 기존의 jsp 문법을 확장시키는 기술을 제공하는 태그
	 	
	 	>> 표준액션태그 (Standard Action Tag) : jsp내에서 곧바로 사용 가능 (별도의 연동 필요없음)
	 									   모든 태그명 앞에 jsp: 접두어 붙음)
	 									   
	    >> 커스텀액션태그 (Custom Action Tag) : jsp내에서 곧바로 사용 불가능 (별도의 연동 과정 필요)
	    								  모든 태그명 앞에 jsp:외의 다른 접두어 붙음 (종류 다양)
	    								  가장 대표적인 라이브러리 JSTL 
	 -->
	 
	 <h1>* JSP Action Tag</h1>
	 <p>XML 기술을 이용해서 기존의 jsp문법을 확장시키는 태그</p>
	 
	 <h3>1. 표준액션태그</h3>
	 <a href="${pageContext.servletContext.contextPath}/views/02_standardAction/include.jsp">01_include 태그 연습</a>
	 <a href="${pageContext.servletContext.contextPath}/views/02_standardAction/forward.jsp">02_forward 태그 연습</a>
	 <h3>2. 커스텀액션태그(JSTL)</h3>
	 <a href="${pageContext.servletContext.contextPath}/views/03_customAction/jstl.jsp">JSTL</a>
</body>
</html>