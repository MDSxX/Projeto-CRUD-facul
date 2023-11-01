<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

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
                font-family:   'Poppins', sans-serif;

            }

            h1{
                padding-top: 0px;
                text-align: center;
            }

            
          
            input#salvar{
                margin-left: 20px;
            }
            h2{
                text-align: center;
            }
            form{
                text-align: center;
            }

        </style>
    </head>
    <body>

        <%
            String id,selectsql, drive;
            String caminho, usuario, senha;
            ResultSet resultado ;
            Connection conexao = null;
            PreparedStatement executandosql = null;

            id = request.getParameter("idfun");

            drive = "com.mysql.cj.jdbc.Driver";
            Class.forName(drive);

            caminho = "jdbc:mysql://localhost:3306/mercado";
            usuario = "root";
            senha = "62362842";
            conexao = DriverManager.getConnection(caminho, usuario, senha);

            selectsql = "SELECT * FROM funcionario WHERE id_fun =?";
            executandosql = conexao.prepareStatement(selectsql);
            executandosql.setString(1, id);
            resultado = executandosql.executeQuery();
            
             if (resultado.next()) {
        %>
        
        <h2>Alteração de Dados</h2>
        
        <form method="post" action="update.jsp">
            

            <label for="nome">Nome do Funcionario:</label>
            <input id="nome" type="text" name="nomefun" size="20"  value="<%= resultado.getString("nome")%>">

            <label for="funcao">Função:</label>
            <input id="funcao" type="text" name="posto" size="20"  value="<%= resultado.getString("funcao")%>">


            <label for="cpf">CPF:</label>
            <input id="cpf" type="number" name="idcpf"  value="<%= resultado.getString("cpf")%>">

            <label  for="salario">Salario:</label>
            <input id="salario" type="text" name="salariofun" size="7"  value="<%= resultado.getString("salario")%>">


            <input id="salvar" type="submit" value="Salvar">
            <input type="hidden" name="id" value="<%= id%>">
        </form>
            <%
        } else {
        %>
        <p>Funcinario não encontrado.</p>
        <%
            }
            
        %>
    </body>
</html>
