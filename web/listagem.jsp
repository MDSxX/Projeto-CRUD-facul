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
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300&display=swap" rel="stylesheet">
        <title>JSP Page</title>

        <style>
            *{
                margin: 0 auto;
                font-family:  'Poppins', sans-serif;
                padding: 3px;
                color: black;
            }

            table{
                text-align: center;
                width: 90%;
                background-color: #5cc479;
                border-collapse: collapse;
            }

            th,
            td,
            table{
                border: solid black 1px;
            }
            h2{
                text-align: center;
            }
            

        </style>
    </head>
    <body>
        <%
            String sql, caminho, usuario, senha, drive;
            ResultSet resultado;
            Connection conexao = null;
            PreparedStatement executandosql = null;

            drive = "com.mysql.cj.jdbc.Driver";
            Class.forName(drive);

            caminho = "jdbc:mysql://localhost:3306/mercado";
            usuario = "root";
            senha = "62362842";
            conexao = DriverManager.getConnection(caminho, usuario, senha);

            sql = "select * from  funcionario";
            executandosql = conexao.prepareStatement(sql);
            resultado = executandosql.executeQuery();


        %>
        <h2>Listagem dos Funcionario</h2>
        <table>
            <tr>
                <th>CPF</th>
                <th>NOME</th>
                <th>FUNÇÃO</th>
                <th>SALARIO</th>
            </tr>
            <%                while (resultado.next()) {
            %>

            <strong>
                <tr>
                    <td> <% out.print(resultado.getString("cpf")); %> </td>
                    <td> <% out.print(resultado.getString("nome")); %> </td>
                    <td> <% out.print(resultado.getString("funcao")); %> </td> 
                    <td> <% out.print(resultado.getString("salario"));%> </td>

                    <td>
                        <form method="post"action="alterafun.jsp">
                            <input type="hidden" name="idfun" value="<%= resultado.getString("id_fun")%>">
                            <input type="submit" value="altera">
                        </form>
                    </td>
                </tr>
            </strong>
            <%
                }
            %>

        </table>

    </body>
</html>

