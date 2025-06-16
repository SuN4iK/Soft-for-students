<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="resources/css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Kelly+Slab&display=swap" rel="stylesheet">

        <title>Вход в систему</title>
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

.beginning{
    margin-top:5rem;
    text-align:center;
}

.other{
    padding:7px;
    border:2px solid #000;
    border-radius:10%;
}
</style>

<main class="main">
    <h1 class="main-heading"> система управления студентами и их успеваемостью</h1></h1>
    <div class="beginning">
    <h2 class="heading-secondary">Введите логин и пароль</h2>

    <form action="login" method="post">
    <p>Логин:</p>
    <input name="login" type="text">
    <p>Пароль:</p>
        <input name="password" type="password">
        <p>Роль:</p>
            <select name="role">
            <option value="1" >Администратор</option>
            <option value="2" >Студент</option>
            <option value="3" >Учитель</option>


            </select>
            </br>
            <input type="submit" value="войти" class="other">

    </form>

    <c:if test="${message eq '1'}">
    <h3>Пожалуйста заполните все поля!</h3>
    </c:if>

    <c:if test="${message eq '2'}">
        <h3>Пользователь не найден!</h3>
        </c:if>
</div>
</main>

</body>
</html>