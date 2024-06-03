# eljstlProject
 el 표현법, JSTL
----
### 2024.04.01(월) 
##### 스크립틀릿 -> EL 표기법으로 바꾸기
   - EL 사용시 특정 scope로부터 값을 뽑을 때 키값 제시만으로 해당 attribute가 출력됨
   - EL 사용시 별도로 scope를 제시하지 않을 경우 모든 scope 탐색해서 찾아진 값을 출력해줌 : page -> request -> session -> application 공유범위가 좁은것에서부터 탐색
   - 만일, 모든 영역에서 못 찾았을 경우 아무것도 출력이 안되고 오류도 발생하지 않음

##### EL 연산자
1. 산술 연산
div : 나눗셈
mod : 나머지
+, -, *는 자바와 동일한 방식으로 사용됨

2. 대소 비교 연산, 동등 비교 연산
gt : >
ge : >=
lt : <
le : <=
eq : ==
not num1 eq num2 : num1 != num2

3. 객체가 null인지 리스트가 비어있는지
null인지 : ${num eq null} 또는 ${empty num} 또는 ${num == null}
null이 아닌지 : ${num != null} 또는 ${not empty num}

4. 논리 연산자
${true && false} 또는 ${true and true}
${true || false} 또는 ${true or true}

##### jsp:include
1. include 지시어를 이용한 방식 (정적 include)
또다른 페이지를 포함하고자 할 때 쓰는 태그
컴파일시 애초에 포함되어있는 형태
include하고 있는 페이지상에 선언되어있는 변수를 현재 페이지에서도 이어서 사용 가능
단, 현재 이 페이지에서 동일한 이름의 변수를 재선언할 수 없음 
```jsp
 <%@ include file="/views/02_standardAction/footer.jsp" %>
```

2. JSP 표준액션 태그를 이용한 방식 (동적 include)
런타임시 포함되는 형태
include하고 있는 페이지에 선언된 변수를 공유하지 않음
동일한 이름의 변수로 재선언 가능

해당 페이지를 포함할 때 include 하는 페이지로 값 전달할 수 있음
```jsp
 <jsp:include page="/views/02_standardAction/footer.jsp">
   <jsp:param value="test" name="test"/>
</jsp:include>
```
##### jsp:forward
jsp에서 또다른 jsp로 포워딩하고자 할 때
```jsp
 <jsp:forward page="/views/01_El/elBasic.jsp"/>
   <jsp:param name="test" value="Hello World"/>
</jsp:forward>
```
##### JSTL Core Library
JSTL을 사용하기 위해서는 WEB-INF/lib 폴더에 JSTL JAR 파일 넣어두고, taglib 지시어를 이용해 선언해야됨
```jsp
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
```

1. 변수 (attribute)
변수 선언과 동시에 초기화
변수 선언하고 초기값을 대입해두는 기능을 제공
해당 변수를 어떤 scope에 담을건지 지정 가능함 (생략시 기본적으로 pageScope)
key-value 형태로 데이터 담는 구문
c:set으로 선언된 변수는 EL을 이용해 꺼내 사용 (스크립팅 원소로는 접근 불가)
변수의 타입을 별도로 지정하지 않음
초기값을 반드시 지정해야됨
```jsp
<c:set var="변수명" value="담고자하는값" [scope="어떤스코프에담을건지"]/>
```

2. 변수 삭제
해당 scope 영역에서 해당 변수를 찾아서 제거하는 태그
scope 지정 생략시 모든 scope로부터 다 찾아져서 제거
즉, 해당 scope에 .removeAttribute("변수")를 통해 제거
```jsp
<c:remove var="result" scope="request"/>
```

3. 변수(데이터) 출력
데이터를 출력하고자 할 때 사용하는 태그
escapeXml은 출력값에 html 태그가 껴있는 경우 해당 값을 false로 지정하면 html 태그 제외하고 출력됨
```jsp
<c:out value="출력하고자하는값" [default="기본값"] [escapeXml="true|false"]>
```

4. 조건문
JAVA의 단일 if문과 비슷한 역할을 하는 태그
조건식을 EL 표현법으로 기술해야됨
```jsp
<c:if test="조건식">
```

----
### 2024.04.02(화)
##### 마이페이지 : 스크립틀릿으로 작성된 코드 EL 표현법으로 바꾸기

##### EL 표현법 반복문 복습
```jsp
<c:if test="${str eq '안녕하세요'}">
 <h4>Hello World</h4>
</c:if>

<c:if test="${str ne '안녕하세요'}">
 <h4>Bye World</h4>
</c:if>
```

