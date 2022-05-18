<%-- 
    Document   : cabecalho
    Created on : 25 de abr de 2022, 13:50:47
    Author     : KGe
--%>

<!-- Inicio cabecalho-->
<div id="cabecalho" class="jumbotron"><h1>Aplicação BookStoreWeb</h1></div>

<style>
    #cabecalho{
        
    }
    
    a{
        margin-left: 10px;
    }
    
    #btnSair{
        color: red;
    }
    
    #novoLivro{
        color: 'green';
    }
    
    
</style>

<p class="text-center">

    <a id="novo" href="<%=request.getContextPath()%>/bstore/new" class="btn btn-primary">
        <span class="glyphicon glyphicon-plus"></span> Novo Livro</a>

    <a id="novoLivro" href="<%=request.getContextPath()%>/bstore/list" class="btn btn-default">
        <span class="glyphicon glyphicon-th-list"></span>
        Lista todos Livros</a>

    <a id="listaUsers" href="<%=request.getContextPath()%>/bsuser/list" class="btn btn-default">
        <span class="glyphicon glyphicon-th-list"></span>
        Lista todos Usuários</a>        
        
    <a id="btnSair" href="<%=request.getContextPath()%>/logout" class="btn btn-default">
        <span class="glyphicon glyphicon-off"></span>
        Sair</a>
</p>

<!-- Fim cabecalho--> 