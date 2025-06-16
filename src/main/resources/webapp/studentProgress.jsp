<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page isELIgnored="false" %>
<%@page import="org.example.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Успеваемость студента</title>
</head>
<body>

<style>

*{
*{
margin:0;
padding:0;
box-sizing: border-box;
}

body{
background-image:linear-gradient(#d1cccce7, #523131d8);
background-size:cover;
background-attachment:fixed;
height: 100vh;
display:flex;
justify-content: space-between;

padding: 1rem 2rem;
text-shadow:5px 5px 3px #369;
font-family:'Kelly Slab', cursive;
}

.main{
flex-grow: 3;
margin-top: 1rem;
}

.main-heading{
    border:2px solid #000;
    padding: 0.5rem 1rem;
    text-align:center;
    margin: 2rem 10rem;
}

a{
font-size:1.5rem;
}

.container{
display:flex;
justify-content:space-around;
}

.logout{
flex-grow:1;
text-align:center;
}

.navigation{
    flex-grow:1;
    margin-top:5rem;
    margin-left:3rem;
    align-self:flex-start;

}

.heading-secondary{
    margin-top:2rem;
    margin-bottom:1rem;


}

table{
border-collapse:collapse;
height:2rem;
}

tr, th,td{
    padding:1rem 1.5rem;
}

th{
    background-color: #ca9090;
}

.student-btns{
    display:flex;

}

.student-btn{
    width:20rem;
    padding:5px;

}

.student-btns1{
    display:flex;
    flex-direction:column;

}

.field{
    display:flex;
    flex-direction:column;
    margin-left: 7rem;
    padding: 8px;
    border: 2px solid #000;
    border-radius:10%;
}

.cell1{
    width:11rem;
    text-align: "left";
}

.semestr-note{
    display:flex;
    justify-content:space-between;
    margin-top:3rem;
}

.choice-semester{
    justify-content:space-between;

}

.choice-btn{
height:1.5rem;
border: 1px solid rgb(7,0,0);
background-color: rgb(202,144,144);
padding: 1px 20px 1px 20px;
}


</style>

<aside class="navigation">
<a href = "/" class="navigation-item">На главную</a>
<a href = "students" class="navigation-item">Назад</a>
</aside>


<main class="main">
    <h1 class="main-heading"> система управления студентами и их успеваемостью</h1>



<h2 class="heading-secondary">Успеваемость студента:</h2>
<div class="container">
<table border="1" class="student-table">
<tr>

            <th>фамилия</th>
            <th>имя</th>
            <th>группа</th>
            <th>дата поступления</th>

        </tr>
            <tr>

                <td>${student.surname}</td>
                <td>${student.name_student}</td>
                <td>${student.group_student}</td>
                <td><fmt:formatDate value="${student.date_student}" pattern="dd/MM/yyyy"/></td>

            </tr>

</table>
</div>


<section class="semestr-note">
<div>
<table class="discipline-note">
<tr>
<th>Дисциплина</th>
<th>Оценка</th>
</tr>
<c:forEach items = "${marks}" var="m">
<tr>
<td>${m.discipline.discipline}</td>
<td>${m.mark}</td>
</tr>
</c:forEach>
</table>
</div>

<div class="choice-semester">
<h2>Выбрать семестр</h2>
<form action="studentProgress" method="get">
<input type="hidden" name="hiddenIdToProgress" value="${student.id}">
<select name="idSelectedTerm">
<c:forEach items="${terms}" var="t">
<c:choose>
<c:when test="${t.id eq selectedTerm.id}">
<option selected value="${t.id}">${t.term}</option>
</c:when>
<c:otherwise>
<option  value="${t.id}">${t.term}</option>
</c:otherwise>
</c:choose>
</c:forEach>
</select>
<input type="submit" value = "выбрать" class="field">
</form>
</div>
</section>
</main>

<aside>
<c:choose>
<c:when test="${isLogin eq 1}">
<a href = "logout" class="logout-btn">Logout, ${login}</a>
</c:when>
<c:otherwise>
<a href = "login" class="logout-btn">Login</a>
</c:otherwise>
</c:choose>
</aside>




</body>
</html>