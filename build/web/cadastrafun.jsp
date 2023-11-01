<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

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
                text-align: center;
                padding: 10px;
                font-family:  'Poppins', sans-serif;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <%
            String nomefunc, cargo, cpf, salario, drive;
            String caminho, usuario, senha;
            String insertsql;
            Connection conexao = null;
            PreparedStatement executandosql = null;

            nomefunc = request.getParameter("nomefun");
            cargo = request.getParameter("posto");
            cpf = request.getParameter("idcpf");
            salario = request.getParameter("salariofun");

            try {
                drive = "com.mysql.cj.jdbc.Driver";
                Class.forName(drive);

                caminho = "jdbc:mysql://localhost:3306/mercado";
                usuario = "root";
                senha = "62362842";
                conexao = DriverManager.getConnection(caminho, usuario, senha);

                insertsql = "INSERT INTO funcionario(cpf,nome,funcao,salario) VALUES(?,?,?,?)";
                executandosql = conexao.prepareStatement(insertsql);
                executandosql.setString(1, cpf);
                executandosql.setString(2, nomefunc);
                executandosql.setString(3, cargo);
                executandosql.setString(4, salario);
                executandosql.executeUpdate();

                out.print("Parabéns");

            } catch (SQLException erro) {
                if (erro.getMessage().contains("Duplicate entry")) {
                    out.print("ja existe esse funcionario");
                } else {
                    out.print("erro no banco de dados" + erro.getMessage());
                }
            } catch (Exception nsql) {
                out.print("erro " + nsql.getMessage());
            }
        %>
    </body>
</html>
