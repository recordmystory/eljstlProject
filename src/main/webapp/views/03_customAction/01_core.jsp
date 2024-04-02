<%@page import="com.br.vo.Person"%>
<%@page import="java.util.*"%>
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
	
	<br>
	
	<c:set var="str" value="안녕하세요"/>
		 
	 <c:if test="${str eq '안녕하세요'}">
	 	<h4>Hello World</h4>
	 </c:if>

	<c:if test="${str ne '안녕하세요'}">
	 	<h4>Bye World</h4>
	 </c:if>
	
	<%--
		<% if(str.equals("안녕하세요")){
		<% } %>
	 --%>

	<br><br>
	
	<h3>3. 조건문 - Choose (c:choose, c:when, c:otherwise)</h3>
	<pre>
		- Java의 if-else, if-else if문과 비슷한 역할의 태그
		- 각 조건들을 c:choose의 하위 요소로 c:when을 통해서 작성
		- c:otherwise 태그는 else문 역할
	</pre>
	
	<%-- 
		<% if(num1 > 20){ %>
		
		<% } else if(num1 >= 10) { %>
		
		<% } else { %>
		
		<% } %> 
	--%>
	
	num1 값 : ${num1}<br>
	<c:choose>
		<c:when test="${num1 gt 20}">
			<b>안녕하세요</b>
		</c:when>
		
		<c:when test="${num1 ge 10}">
			<b>안녕히가세요</b>		
		</c:when>
		
		<c:otherwise>
			<b>어서오세요</b>		
		</c:otherwise>
	</c:choose>
	
	<hr>
	<br>
	
	<h3>4. 반복문 - forEach</h3>
	<pre>
		- for loop문 : (c:forEach var="변수명" begin="초기값" end="끝값" [step="반복시 증가값"])
		- 향상된 for문 : (c:forEach var="변수명" items="순차적으로접근하고자하는객체(배열 | 컬렉션) [varStatus="현재접근된요소의상태값들을보관할변수명"]")
	</pre>
	
<%-- 	
	<% for(int i=1; i<=10; i++){ %>
	
	<% } %>
 --%>	
	
	<c:forEach var="i" begin="1" end="10" step="1">
		반복확인 : ${i}<br>
	</c:forEach>
	
	<br>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		2씩 증가 : ${i}<br>
	</c:forEach>
	
	<!-- 태그 안에 el구문 작성으로 h1, h2, h3, h4, h5, h6 요소 만들기 -->
	<c:forEach var="a" begin="1" end="6">
		<h${a}>태그안에서도 el 사용 가능<h${a}>
	</c:forEach>
	
	<% 
		// 향상된 for문 테스트용 데이터 세팅
		String[] color = {"red", "yellow", "blue", "pink"};
		request.setAttribute("colors", color);
		
		// list.add 대신 다른 메솓, 사용해보기
		List<Person> list = Arrays.asList
		(
			new Person("김동동", 22, "남자"),
			new Person("김디디", 29, "여자"),
			new Person("고길동", 45, "남자")
		);
		
		request.setAttribute("pList", list);
	%>
	
	<ul>
		<c:forEach var="c" items="${colors}">
			<li style="color:${c}">${c}</li>	
		</c:forEach>
	</ul>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<%-- <% if(list.isEmpty()) { %>
				
			<% } else { %>
				<% for(Person p : list) { %>
				<% } %>
			<% } %> --%>
			
			<c:choose>
			
				<c:when test="${empty pList}">
					<tr>
						<td colspan="3">조회된 사람이 없습니다.</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="p" items="${pList}" varStatus="s">
						<tr>
							<td>${s.count}</td> <!-- status의 index : 인덱스값, count: 순번 -->
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
				
			</c:choose>
		</tbody>
	</table>
	
	<%-- <%=list.get(i).getName()%> --%>
	1번 인덱스의 사람 이름 : ${pList[0].name}
	
	<hr>
	
	<h3>5. 반복문 - forTokens</h3>
	<pre>
		(c:forTokens var="변수명" items="분리시키고자하는문자열" delims="구분자")
		
		- 구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하면서 반복 수행
		- Java의 split 또는 StringTokenizer와 비슷한 기능 처리
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰.TV,에어컨/냉장고.세탁기"/>
	<c:out value="${device}"></c:out>
	
	<ol>		
		<c:forTokens var="d" items="${device}" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url 제작 - c:url, c:param</h3>
	<pre>
		- url 경로를 생성하고, 쿼리스트링(?key=value&key=value)을 정의홰둘 수 있는 태그
		
		c:url var="변수" value="요청할url"
			c:param name="키값" value="전달할값" /
			c:param name="키값" value="전달할값" /
		/c:url
	</pre>
	
	<a href="list.do?page=1&num=2">기존방식</a><br>
	
	<c:url var="ttt" value="list.do">
		<c:param name="page" value="1"/>
		<c:param name="num" value="2"/>
	</c:url>
	
	<a href="${ttt}">c:url 이용한 방식</a>

</body>
</html>