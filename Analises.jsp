

<%@page import="model.Analise"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String perfil = (String) session.getAttribute("validaAdm");
    if (perfil == null) {
        response.sendRedirect("http://localhost:8080/ProjetoLoja/login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            h1,h2,tr,td{
                text-align: center;
            }
            li{
                list-style-type: none;
            }
             body{
                background-image: url(Imagens/Jordan2.jpg);
                
                
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=ConsultarTodos">
                <img src="Imagens/logo1.png" alt="Logo" width="32" height="28" class="d-inline-block align-text-top">
                Jordan Supply
            </a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link active" aria-current="page" href="http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=ConsultarTodos">Cadastros</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link active" aria-current="page" href="http://localhost:8080/ProjetoLoja/Controle_Analise?op=consultarAnalise">Análises</a>
                    </li>
                </ul>
                <ul class="form-inline my-2 my-lg-0">
                    <li class="nav-item active">
                        <a class="btn btn-danger me-5" href="deslogar.jsp">Sair</a>
                    </li>
                </ul>
            </div>
        </nav>
        <%                 
            List<Analise> MaioresVendas = (List<Analise>) request.getAttribute("MaioresVendas");
            List<Analise> QuantidadeVendas = (List<Analise>) request.getAttribute("QuantidadeVendas");
            List<Analise> ProdutosMaisVendidos = (List<Analise>) request.getAttribute("ProdutosMaisVendidos");

        %>
        <br>
    <center>
        <iframe title="Aula PBI" width="1140" height="541.25" src="https://app.powerbi.com/reportEmbed?reportId=ba4a53d9-f378-4409-a78f-a3598cda3e00&autoAuth=true&ctid=53b7d7a8-f263-42f4-8ced-11a95d2f5a38" frameborder="0" allowFullScreen="true"></iframe>
    </center>
    <br>
    <h2>Maiores Vendas</h2>
    <br>
    <table class="table table-hover table-dark">
        <tr>
            <th>ID</th>
            <th>Nome do Cliente</th>
            <th>Valor de Compra</th>

        </tr>

        <%  for (Analise cmv : MaioresVendas) {%>
        <tr>
            <td><%out.print(cmv.getId());%></td>
            <td><%out.print(cmv.getNome());%></td>
            <td>R$ <%out.print(cmv.getValor());%>,00</td>
        </tr>
        <% }
        %>
    </table>
    <br>
    <h2>Quantidade de compras por Cliente</h2>
    <br>
    <table class="table table-hover table-dark">
        <tr>
            <th>Cliente</th>
            <th>E-mail</th>
            <th>Quantidade de Compras</th>
        </tr>

        <%  for (Analise cc : QuantidadeVendas) {%>
        <tr>
            <td><%out.print(cc.getNome());%></td>
            <td><%out.print(cc.getEmail());%></td>
            <td><%out.print(cc.getQuantidade());%></td>
        </tr>
        <% }
        %>
    </table>
    <br>
    <h2>Produtos mais Vendidos</h2>
    <br>
    <table class="table table-hover table-dark">
        <tr>
            <th>Produto</th>
            <th>Média de Tamanhos Vendidos</th>
            <th>Quantidade de Vendas</th>
        </tr>

        <%  for (Analise pmv : ProdutosMaisVendidos) {%>
        <tr>
            <td><%out.print(pmv.getProduto());%></td>
            <td><%out.print(pmv.getTamanho());%></td>
            <td><%out.print(pmv.getQuantidade());%></td>
        </tr>
        <% }
        %>
    </table>
</body>
</html>
