<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login Bookstore</title>
    </head>
    <style>
        body{
            background-color: beige; 
        }
        
    </style>
    
    <body>
        <div style="text-align: center">
            <h1>Admin Login</h1>
            <form action="login" method="post">
                <label for="email" id="email">Email:</label>
                <input name="email" size="15" />
                <br><br>
                <label for="password">Password:</label>
                <input type="password" name="password" size="15" />
                <!--
                Esse atributo MESSAGE será utilizado como retorno de 
               mensagem ao usuário caso
                login inválido.
                -->
                <br>${message}<br><br> 
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
</html>
