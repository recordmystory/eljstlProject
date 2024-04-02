<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<h1>JSTL이란?</h1>
	<p>
		JSP Standard Tag Library의 약자로 JSP에서 사용되는 커스텀액션 태그 <br>
		공통적으로 빈번하게 사용되는 코드들을 집합시켜서 보다 쉽게 사용할 수 있도록 태그화해서 제공하는 라이브러리
	</p>
	
	<h3>* 라이브러리 다운로드 후 lib 폴더에 추가</h3>
	1) 아파치톰캣 사이트 접속<br>
	2) 메뉴바 Downloads > Taglibs 메뉴 클릭<br>
	3) impl, spec JAR 파일 다운로드<br>
	4) /WEB-INF/lib/에 추가<br>
	
	<h3>* JSTL 선언 방법</h3>
	<p>
		JSTL 기술을 사용하고자 하는 jsp 페이지 상단에 taglib 지시어를 이용해 선언해야됨
		&lt;%@taglib prefix="접두어" uri="라이브러리 파일상의 uri 주소" &gt;
	</p>
	
	<h4>1. JSTL Core Library</h4>
	<p>변수와 제어문(조건문, 반복문) 등 로직과 관련된 문법을 제공</p>
	
	<a href="01_core.jsp">core library</a>
	
	<h4>2. JSTL Formatting Library</h4>
	<p>숫자, 날짜 및 시간 데이터의 출력 형식을 지정할 때 사용하는 문법</p>
	
	<a href="02_formatting.jsp">fmt library</a>
	
	<h4>3. JSTL Functions Library</h4>
	<p>EL 안에서 사용할 수 있는 함수들을 제공</p>
	<a href="03_functions.jsp">fn library</a>
</body>
</html>