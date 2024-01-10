
<%@page import="java.util.List"%>
<%@page import="model.Pedido"%>
<%@page import="model.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String perfil = (String) session.getAttribute("validaCliente");

    if (perfil == null) {
        response.sendRedirect("http://localhost:8080/ProjetoLoja/login.jsp");
    } else {
        int idCliente = (int) session.getAttribute("idCliente");
        String nome = (String) session.getAttribute("nome");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            li {
                list-style-type: none;
            }

            h1,h2{
                text-align: center;
                color: white;
            }
            body{
                background-image: url(Imagens/Wallpaper.jpg);
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="http://localhost:8080/ProjetoLoja/Catalogo.jsp">
                <img src="Imagens/logo1.png" alt="Logo" width="32" height="28" class="d-inline-block align-text-top">
                Jordan Supply
            </a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link active" aria-current="page" href="http://localhost:8080/ProjetoLoja/Catalogo.jsp">Catálogo</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link active" aria-current="page" href="http://localhost:8080/ProjetoLoja/Controle_Pedido?op=ConsultarTodos&idCliente=<%out.print(idCliente);%>">Pedidos</a>
                    </li>
                </ul>

                <ul class="form-inline my-2 my-lg-0">
                    <li class="nav-item active">
                        <a class="btn btn-danger me-5" href="deslogar.jsp">Sair</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <h1>Pedidos do Cliente: <% out.print(nome); %></h1>
        <br>
        <%
            List<Pedido> lprod = (List<Pedido>) request.getAttribute("lprod");
            Pedido valor = (Pedido) request.getAttribute("valor");


        %>

        <table class="table table-hover table-dark">
            <tr>
                <th>ID</th>
                <th>Produto</th>
                <th>Cor</th>
                <th>Tamanho</th>
                <th>Preço</th> 
                <th>Editar</th>
                <th>Excluír</th>
            </tr>
            
            <%                 for (Pedido p : lprod) {%>
            <tr>
                <td><%out.print(p.getId());%></td>
                <td><%out.print(p.getProduto());%></td>
                <td><%out.print(p.getCor());%></td>
                <td><%out.print(p.getTamanho());%></td>
                <td><%out.print(p.getPreco());%>,00 R$</td>
                <td><a href="http://localhost:8080/ProjetoLoja/Controle_Pedido?op=Editar&id=<%out.print(p.getId());%>"><img src="Imagens/edit.png" height="40px" width="40px"></a></td>
                <td><a href="http://localhost:8080/ProjetoLoja/Controle_Pedido?op=Deletar&id=<%out.print(p.getId());%>"><img src="Imagens/Lixeira.png" height="40px" width="40px"></a></td>
            </tr>
            <% }
            %>
        </table>

        <h2 class="table table-hover table-dark"><img src="Imagens/carrinho-de-compras.png" height="40px" width="40px"> Valor total: R$ <% out.print(valor.getValor()); %>,00</h2>
        <% }%>
    </body>
</html>
