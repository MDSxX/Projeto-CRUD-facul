<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&display=swap" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            *{
                font-family:  'Poppins', sans-serif;
                padding: 10px;
                text-align: center;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <%
            String caminho, usuario, senha, deletesql,id, drive;
            Connection conexao = null;
            PreparedStatement executandosql = null;
            Integer resultado;
            
            id = request.getParameter("escolhe");
            
            drive = "com.mysql.cj.jdbc.Driver";
            Class.forName(drive);

            caminho = "jdbc:mysql://localhost:3306/mercado";
            usuario = "root";
            senha = "62362842";
            conexao = DriverManager.getConnection(caminho, usuario, senha);
            
            deletesql = "DELETE FROM funcionario WHERE id_fun = ?";
            executandosql = conexao.prepareStatement(deletesql);
            executandosql.setString(1, id);
            resultado = executandosql.executeUpdate();
            
            if(resultado == 1){
                out.print("Funcionario apagado com sucesso!!");
            }else{
                out.print("Funcionario não foi apagado!!");
            }

        %>
    </body>
</html>
