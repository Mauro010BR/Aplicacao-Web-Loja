
<%@page import="model.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%     String perfil = (String) session.getAttribute("validaCliente");
    if (perfil == null) {
        response.sendRedirect("http://localhost:8080/ProjetoLoja/login.jsp");
    } else {
        String nome = (String) session.getAttribute("nome");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body{
                background-image: url(Imagens/Wallpaper.jpg);


            }
            .botao{
                position: absolute;
                top: 43%;
                left: 54%;
                transform: translate(-50%, -50%);
                fill: white;
                stroke: white;
                filter: drop-shadow(0 0 10px white)  drop-shadow(0 0 200px white) ;
            }
            .botao1{
                position: absolute;
                top: 43%;
                left: 46%;
                transform: translate(-50%, -50%);
                fill: white;
                stroke: white;
                filter: drop-shadow(0 0 10px white)  drop-shadow(0 0 200px white) ;
            }

            h1,label{
                text-align: center;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Altere seu pedido,<% out.print(nome); %>!</h1>
        <br>
        <%
            Pedido ped = (Pedido) request.getAttribute("pedido_id");
        %>
        <form action="Controle_Pedido" method="post"> 
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="produto">Produto: </label>
                    <input type="text" class="form-control" name="" id="" value="<%out.print(ped.getProduto());%>" disabled option>
                </div>
                <div class="form-group col-md-6">
                    <label for="preco">Preço: </label>
                    <input type="text" class="form-control" name="" id="" value="R$ <%out.print(ped.getPreco());%>,00" disabled option>
                </div>
                <div class="form-group col-md-6"> 
                    <label for="tamanho">Tamanho: </label>
                    <select name="tamanho" id="tamanho" class="form-control" required>
                        <option value="39">39</option>
                        <option value="40">40</option>
                        <option value="41">41</option>
                        <option value="42">42</option>
                        <option value="43">43</option>
                        <option value="44">44</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="cor">Cor: </label>
                    <select name="cor" id="cor" class="form-control" required>
                        <option value="Preto">Preto</option>
                        <option value="Branco">Branco</option>
                        <option value="Cinza">Cinza</option>
                    </select>
                </div>
                <div class="botao1">
                    <a class="btn btn-danger btn-lg" href="http://localhost:8080/ProjetoLoja/Catalogo.jsp">Voltar</a>
                </div>
                <div class="botao">
                    <input type="submit" class="btn btn-secondary btn-lg btn-block" id="op" name="op" value="Salvar">
                </div>
            </div>
            <input type="hidden" class="form-control" name="produto" id="produto" value="<%out.print(ped.getProduto());%>">
            <input type="hidden" class="form-control" name="preco" id="preco" value="<%out.print(ped.getPreco());%>">
            <input type="hidden" name="id" id="id" value="<% out.print(ped.getId()); %>">
            <% }%>
        </form>
    </body>
</html>
