<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&display=swap" rel="stylesheet">
        <style>

            *{
                text-align: center;
                padding: 10px;
                font-family:  'Poppins', sans-serif;
                font-size: 20px;
            }
        </style>
    </head>


    <body>
        <%
            String nome, cargo, cpf, sql, salario, caminho, id, usuario, senha, drive;
            Connection conexao;
            PreparedStatement update;
            Integer resultado;

            drive = "com.mysql.cj.jdbc.Driver";
            Class.forName(drive);

            caminho = "jdbc:mysql://localhost:3306/mercado";
            usuario = "root";
            senha = "62362842";
            conexao = DriverManager.getConnection(caminho, usuario, senha);

            id = request.getParameter("id");
            nome = request.getParameter("nomefun");
            cpf = request.getParameter("idcpf");
            cargo = request.getParameter("posto");
            salario = request.getParameter("salariofun");

            sql = "UPDATE funcionario SET nome = ?, cpf = ?, salario = ?, funcao = ? WHERE id_fun = ?";
            update = conexao.prepareStatement(sql);
            update.setString(1, nome);
            update.setString(2, cpf);
            update.setString(3, salario);
            update.setString(4, cargo);
            update.setString(5, id);
            resultado = update.executeUpdate();

            if (resultado > 0) {
        %>
        <p>Atualização bem-sucedida!</p>
        <%
        } else {
        %>
        <p>Erro na atualização.</p>
        <%
            }

        %>
    </body>
</html>