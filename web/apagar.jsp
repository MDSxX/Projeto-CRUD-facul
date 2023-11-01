<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
                margin: 0 auto;
                padding: 10px;
                font-family:  'Poppins', sans-serif;
            }
            #escolhe{
                width: 200px;
            }
            
        </style>
        
    </head>
    <body>
        <%
            String caminho, usuario, senha, selectsql, drive;
            Connection conexao = null;
            PreparedStatement executandosql = null;
            ResultSet resultado;
            Integer id_fun, cont = 1;

            drive = "com.mysql.cj.jdbc.Driver";
            Class.forName(drive);

            caminho = "jdbc:mysql://localhost:3306/mercado";
            usuario = "root";
            senha = "62362842";
            conexao = DriverManager.getConnection(caminho, usuario, senha);
            selectsql = "SELECT * FROM funcionario";
            executandosql = conexao.prepareStatement(selectsql);
            resultado = executandosql.executeQuery();


        %>
        <h2>Apagar Funcionario</h2>
        <div>
            <form method="post" action="excluirFun.jsp">
                <select id="escolhe" name="escolhe" required>
                    <%        while (resultado.next()) {
                    %>
                    <option value="<%= resultado.getString("id_fun")%>">
                        <%= resultado.getString("nome")%> - <%= resultado.getString("cpf")%>
                    </option>
                    <%

                        }
                    %>
                </select>
                <button type="submit">Apagar</button>
            </form>
        </div>
    </body>
</html>
