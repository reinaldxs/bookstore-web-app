<%-- 
    Document   : UserList
    Created on : 4 de mai de 2022, 08:48:41
    Author     : devsys-b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./contents/headerTags.jsp"/>       
        <jsp:include page="./contents/Style.jsp"/>       

        <title>Lista Usuarios</title>

        <style>

            body{

            }

            header{
                text-align: center;
            }

            main {
                min-width: 300px;
                max-width: 800px;
                min-height: 690px;
                margin: auto;
            }

            main table {
                margin: auto;
            }

            nav{
                text-align: center;
            }

            nav > a{
                margin: 0px 25px;
            }

        </style>

    </head>
    <body class="d-flex flex-column min-vh-100">
   
        <div class="container">

            <jsp:include page="./contents/HeaderUsers.jsp" />

            <div class="table-responsive">

                <main>
                    <table class="table">

                        <caption><h2>Lista de Users</h2></caption>

                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Nome Completo</th>
                            <th>Ações</th>
                        </tr>

                        <c:forEach var="user" items="${listaUser}">

                            <tr>
                                <td><c:out value="${user.id}" /></td>
                                <td><c:out value="${user.email}" /></td>
                                <td><c:out value="${user.password}" /></td>
                                <td><c:out value="${user.fullName}" /></td>
                                
                                
                                <td>
                                    <a href="<%=request.getContextPath()%>/bsuser/edit?id=<c:out value='${user.id}'/>">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="<%=request.getContextPath()%>/bsuser/delete?id=<c:out value='${user.id}'                                   />">
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <jsp:include  page="./contents/rodape.jsp"/>
            </div>
        </main>
    </div>
</body>
</html>
