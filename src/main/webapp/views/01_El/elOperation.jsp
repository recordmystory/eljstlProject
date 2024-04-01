<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elOperation</title>
</head>
<body>
	<h1>EL의 연산자</h1>
	
	<h3>1. 산술 연산</h3>
	기존방식 (el 안쓰는 경우) : <%=(int)request.getAttribute("big") + (int) request.getAttribute("small")%>
	<br><br>
	
	el방식<br>
	덧셈연산결과 : ${big + small}<br>
	뺄셈연산결과 : ${big - small}<br>
	곱셈연산결과 : ${big * small}<br>
	
	<!-- div, mod : el 안에서만 쓸 수 있는 나눗셈 연산자 -->
	나눗셈연산결과 : ${big / small} 또는 ${big div small}<br>
	나머지연산결과 : ${big % small} 또는 ${big mod small}<br><br>
	
	문자열간의 덧셈연산<br>
	<b>* 유의사항 : 문자열을 연이어주고자 할대 단순한 자바때처럼 + 연산 사용 불가</b><br>
	>> el 내에서 산술연산 시 내부적으로 각각의 값을 숫자로 파싱한 후에 연산을 진행하기 때문에 NumberFormatException 발생<br>
	<%= (String)request.getAttribute("sOne") + (String)request.getAttribute("sTwo") %>
	<%-- ${sOne + sTwo} --%><br>
	연이어주고자 할 경우 : ${sOne}${sTwo}<br><br><br>
	
	<h3>2. 대소 비교 연산</h3>
	${big > small} 또는 ${ big gt small}<br>
	${big >= small} 또는 ${big ge small}<br>
	${big < small} 또는 ${big lt small}<br>
	${big <= small} 또는 ${big le small}<br>
	
	<h3>3. 동등 비교 연산</h3>
	sOne값이랑 sTwo값이 일치합니까 : ${sOne == sTwo} 또는 ${sOne eq sTwo}<br>
	sOne값이랑 sTwo값이 일치하지 않습니까 : ${sOne != sTwo} 또는 ${not (sOne eq sTwo)} 또는 ${sOne ne sTwo}<br> 
	big에 담긴 값이 10과 일치합니까 : ${big == 10} 또는 ${big eq 10}
	sOne값이 "안녕" : ${sOne == "안녕"} 또는 ${sOne eq '안녕'}<br>
	<%-- ${sOne eq 안녕} : 따옴표로 묶지 않으면 오류남 --%>
	<!-- el 내에서 임의의 문자열 값 제시시 홑따옴표든 쌍따옴표든 가리지 않음 -->
	
	<h3>4. 객체가 null인지 또는 리스트가 비어있는지</h3>
	pTwo가 null입니까 : ${pTwo == null} 또는 ${pTwo eq null} 또는 ${empty pTwo}<br>
	pOne이 null입니까 : ${pOne == null} 또는 ${empty pOne}<br>
	pOne이 null이 아닙니까 : ${pOne != null} 또는 ${not empty pOne}<br>
	lOne이 텅 비어있습니까 : ${empty l1}<br>
	lOne이 비어있지 않습니까 : ${not empty l1}
	
	<h3>5. 논리연산자</h3>
	${true && true} 또는 ${true and true}<br>
	${false || true} 또는 ${false or true}<br><br>
	
	big이 small보다 크고 l1이 텅 비어있습니까 : ${big gt small and empty l1}<br>
	small이 big보다 크거나 sOne과 sTwo가 일치합니까 : ${small gt big or sOne eq sTwo}
</body>
</html>