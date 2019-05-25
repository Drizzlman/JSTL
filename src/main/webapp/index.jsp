<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>JSTL_7</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="script.js"></script>
</head>
<body>
<div id="gradient">

<div class="TaskOne">
<h1 class="funny-title-foreach section-title">Task 1: forEach</h1>
    <c:forEach var="num" begin="1" end="5">
        <p class="foreach">Human ---> ${num}</p>
    </c:forEach><br>



<h1 class="funny-title section-title" >Task 2: set</h1><br>
    <c:set var="hum1" scope="session" value="Alexey"/>
    <c:set var="hum2" scope="page">Alex on this page</c:set>
    <c:set var="hum2" scope="request">Alex in request</c:set>
    <c:set var="hum2" scope="session">Alex in session</c:set>
    <c:set var="hum2" scope="application">Alex in application</c:set>

<p class="scope">Session scope first human ---> <c:out value="${sessionScope.hum1}"/></p>
<p class="scope">Page scope second human ---> <c:out value="${hum2}"/></p>
<p class="scope">Request scope second human ---> <c:out value="${requestScope.hum2}"/></p>
<p class="scope">Session scope second human ---> <c:out value="${sessionScope.hum2}"/></p>
<p class="scope">Application scope second human ---> <c:out value="${applicationScope.hum2}"/></p>
</div>
<div class="TaskTwo">
<h1 class="funny-title section-title">Task 3: table with favourite songs</h1>
    <sql:setDataSource var = "dataSource" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                       url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433; databaseName=Songs" user="admin" password="admin"/>
    <sql:query dataSource = "${dataSource}" var = "result">
        SELECT * FROM Songs;
    </sql:query>

<table border = "1" width = "80%" align="center">
    <tr>
        <th>Id</th>
        <th>AuthorName</th>
        <th>Genre</th>
        <th>Song</th>
        <th>Release</th>
    </tr>
    <c:forEach var = "row" items = "${result.rows}">
        <tr>
            <td><c:out value = "${row.Id}"/></td>
            <td><c:out value = "${row.AuthorName}"/></td>
            <td><c:out value = "${row.Genre}"/></td>
            <td><c:out value = "${row.Song}"/></td>
            <td><c:out value = "${row.Release}"/></td>
        </tr>
    </c:forEach>
</table>
</div>
<div class="TaskThree">

    <h1 class="funny-title section-title">Task 4: jstl functions</h1>
    <h2 class="func">Function startsWith()</h2>
    <c:set var = "string" scope="session" value = "American music has its own history. The development of American music has gone through different changes connected with the life of the country and its people Due to the fact, that the USA is a country of many nations and cultures, American music was very much influenced by their representatives in the 20th century. The rhythmic and lyrical styles of African American music had a great impact on American music in general. Later, elements from the blues and old-time music were adapted and transformed into popular genres. Early in the twentieth century, Lois Armstrong and Duke Ellington developed jazz. Between the 1920s and the 1950s appeared country music, rhythm and blues, and rock and roll. In the 1960s Bob Dylan became one of America’s greatest songwriters, and James Brown introduced funk. The end of the 20th century was crowned with hip hop and house music. American pop stars, such as Elvis Presley, Michael Jackson, and Madonna have become world-famous stars."/>
        <p class="st">Text is next:</p>
        <p class="text"> <c:out value="${sessionScope.string}"/></p>
        <p class="text">In the early years of the 21st century there is a great amount of different types of music, although the music of the 20th century continues to live. For example, the classical genre of music attracts more and more listeners. American composers keep on creating their beautiful music. Most orchestras sound better than ever. Most opera companies enjoy the increasing number of their audience, the half of which is the people of 18 to 24 years old.</p>
        <p class="text">Those who are not fond of classical music, jazz or country music, prefer to listen to pop music. Pop music still calls the attention to many people around the world. As the world has never lost its appetite for the latest American sounds and stars.</p>
    <c:if test = "${fn:startsWith(string, 'German')}">
        <p>Line from this text starts with German</p>

    </c:if>

    <c:if test = "${fn:startsWith(string, 'American')}">
        <p class="st" >Line from this text starts with American.</p>
    </c:if>

    <h2 class="func">Function substringBefore()</h2>
    <p class="st">This is a whole string:</p>
    <c:set var = "string1" scope="session" value = "American music has its own history."/>
    <p class="LineIs"><c:out value="${sessionScope.string1}"/></p>
    <c:set var = "string2" value = "${fn:substringBefore(string1, 'history')}" />
    <p class="st">Final sub string: ${string2}</p>
</div>
    <h1 class="funny-title-created section-title">created by alexey kovalko</h1>
</div>
</body>
</html>
