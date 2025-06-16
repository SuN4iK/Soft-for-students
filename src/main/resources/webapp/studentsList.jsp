<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page isELIgnored="false" %>
<%@page import="org.example.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Students list</title>
   <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
<style>


*{
margin:0;
padding:0;
box-sizing: border-box;
}

body{
background-image:url('кузя.jpg');

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



</style>

<aside class="navigation">
<a href = "/" class="navigation-item">На главную</a>
</aside>

<main class="main">
    <h1 class="main-heading"> система управления студентами и их успеваемостью</h1>


<c:if test ="${role eq 1}">
<div class="student-btns">
<div class="student-btns1">
<form action="studentCreate" method="get" >
                    <input type="submit" class="student-btn"  value="создать студента"/>
                    </form>
                    <script>
                    function studentDelete(){
                        var chekedChekboxes = document.getElementsByClassName('checkbox');
                        var countChecked = 0;
                        var idsToDelete = "";

                        for(var i = 0; i < chekedChekboxes.length; i++){
                            if(chekedChekboxes[i].checked){
                                countChecked++;
                                idsToDelete = idsToDelete + chekedChekboxes[i].value + " ";
                            }
                        }

                        if(countChecked == 0) {
                            alert("пожалуйста выберите студента");
                            return;
                        }

                        document.getElementById('hiddenIdsToDelete').value = idsToDelete;
                        document.getElementById('formToDelete').submit();
                    }

                    function studentProgress(){
                        var chekedChekboxes = document.getElementsByClassName('checkbox');
                        var countChecked = 0;
                        var idStud;

                        for(var i = 0; i < chekedChekboxes.length; i++){
                            if(chekedChekboxes[i].checked){
                                countChecked++;
                                idStud = chekedChekboxes[i].value;
                            }
                        }

                        if(countChecked == 0){
                            alert("Pleas, select student!!");
                            return;
                        }

                        if(countChecked > 1){
                            alert("Pleas, select only one student!!");
                            return;
                        }


                        document.getElementById('hiddenIdToProgress').value = idStud;
                        document.getElementById('formToProgress').submit();
                    }
                    </script>
                    </div>
<div class="student-btns1">
                <input onclick="studentDelete()" type="submit" value="удалить выбранных студентов" class="student-btn"/>
                <input onclick="studentProgress()" type="submit" class="student-btn" value="Посмотреть успеваемость выбранного студента"/>
                </div>
                </div>
</c:if>
<h2 class="heading-secondary">Список студентов</h2>
<table border="1" class="student-table">
<tr>
            <th>#</th>
            <th>фамилия</th>
            <th>имя</th>
            <th>группа</th>
            <th>дата поступления</th>

        </tr>
<c:forEach items="${students}" var="st">
            <tr>
                <td><input class="checkbox" type="checkbox" id="checkbox" name="checkbox" value="${st.id}">
                </td>
                <td>${st.surname}</td>
                <td>${st.name_student}</td>
                <td>${st.group_student}</td>
                <td><fmt:formatDate value="${st.date_student}" pattern="dd/MM/yyyy"/></td>

            </tr>
        </c:forEach>
</table>

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

<form action="studentDelete" method="get" id="formToDelete">
    <input type="hidden" name="hiddenIdsToDelete" id="hiddenIdsToDelete">
</form>

<form action="studentProgress" method="get" id="formToProgress">
    <input type="hidden" name="hiddenIdToProgress" id="hiddenIdToProgress">
</form>


</body>
</html>