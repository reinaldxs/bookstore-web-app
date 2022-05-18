<%-- 
    Document   : HeaderUser
    Created on : 18 de mai de 2022, 08:19:46
    Author     : devsys-b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="cabecalho" class="jumbotron"><h1>Aplicação BookStoreWeb</h1></div>

<p class="text-center">

    <a id="novo" href="<%=request.getContextPath()%>/bsuser/new" class="btn btn-primary">
        <span class="glyphicon glyphicon-plus"></span> Novo Usuário</a>

    <a id="novoLivro" href="<%=request.getContextPath()%>/bsuser/list" class="btn btn-default">
        <span class="glyphicon glyphicon-th-list"></span>
        Lista todos Usuários</a>

    <a id="btnSair" href="<%=request.getContextPath()%>/bstore/list" class="btn btn-default">
        <span class="glyphicon glyphicon-off"></span>
        Voltar Livros</a>
</p>