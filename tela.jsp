
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String perfil = (String) session.getAttribute("validaCliente");

    if (perfil == null) {
        response.sendRedirect("http://localhost:8080/ProjetoLoja/login.jsp");
    } else {
        int idCliente = (int) session.getAttribute("idCliente");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            h1{
                color: white;
                position: absolute;
                top: 35%;
                left: 40%;
            }
            body{
                background-image: url(Imagens/Wallpaper.jpg);
            }
            .botao1{
                position: absolute;
                top: 53%;
                left: 50%;
                transform: translate(-50%, -50%);
                fill: white;
			stroke: white;
			filter: drop-shadow(0 0 10px white)  drop-shadow(0 0 200px white) ;
            }
        </style>
    </head>
    <body>
        <h1>Pedido excluído!</h1>
        <div class="botao1">
                    <a class="btn btn-danger btn-lg" href="http://localhost:8080/ProjetoLoja/Controle_Pedido?op=ConsultarTodos&idCliente=<%out.print(idCliente);%>">Voltar</a>
                </div>
        <% } %>
    </body>
</html>
