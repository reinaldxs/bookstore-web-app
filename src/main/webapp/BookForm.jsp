<%-- 
    Document   : BookForm
    Created on : 25 de abr de 2022, 13:53:28
    Author     : devsys-b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Aplicação Books Store</title>
        <jsp:include page="./contents/headerTags.jsp"/>
        <jsp:include page="./contents/Style.jsp"/> 

    </head>

    <style>
        #enviar:hover{
            color: var(--cor2);
        }
    </style>


    <body>
        
        <div class="container">

            <jsp:include page="./contents/cabecalho.jsp" />

            <div align="left">
                <c:if test="${book != null}">
                    <form action="update" method="post">
                    </c:if>
                    <c:if test="${book == null}">
                        <form action="insert" method="post">
                        </c:if>
                        <div class="table-responsive">
                            <table class="table">
                                <caption>
                                    <h2>
                                        <c:if test="${book != null}">
                                            Editar Livro
                                        </c:if>
                                        <c:if test="${book == null}">
                                            Adicionar novo Livro
                                        </c:if>
                                    </h2>
                                </caption>
                                <c:if test="${book != null}">
                                    <input type="hidden" name="formId" value="<c:out 
                                               value='${book.id}' />" />
                                </c:if> 
                                <tr>
                                    <th>Titulo: </th>
                                    <td>
                                        <input type="text" name="formTitulo" size="55"
                                               value="<c:out value='${book.titulo}' />"
                                               />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Autor: </th>
                                    <td>
                                        <input type="text" name="formAutor" size="55"
                                               value="<c:out value='${book.autor}' />"
                                               />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Preco: </th>
                                    <td>
                                        <input type="text" name="formPreco" size="3"
                                               value="<c:out value='${book.preco}' />"
                                               />
                                    </td>
                                </tr>
                                <tr>
                                    <td id="enviar" colspan="2" align="center" >
                                        <input type="submit" value="Enviar" />
                                    </td>
                                </tr>
                            </table>
                    </form>
                    <jsp:include page="./contents/rodape.jsp"/>

            </div>                                  
        </div> 
    </div>
</body>
</html>
