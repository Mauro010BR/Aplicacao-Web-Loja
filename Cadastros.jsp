

<%@page import="java.util.List"%>
<%@page import="model.Cadastro"%>
<%@page import="model.Cadastro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String perfil = (String) session.getAttribute("validaAdm");
    if (perfil == null) {
        response.sendRedirect("http://localhost:8080/ProjetoLoja/login.jsp");
    }
    String nomeUsuario = (String) session.getAttribute("nomeUsuario");


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastros</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            li {
                list-style-type: none;
            }
            h1,h2{
                text-align: center;
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
                <form action="Controle_Cadastro" method="POST" class="form-inline my-2 my-lg-0">
                    <input name="id" id="id" class="form-control mr-sm-2" type="search" placeholder="Insira o ID" required>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="op" id="op" value="BuscarID">Buscar</button>
                </form>
                <ul class="form-inline my-2 my-lg-0">
                    <li class="nav-item active">
                        <a class="btn btn-danger me-5" href="deslogar.jsp">Sair</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <h1>Bem vindo usuário: <% out.print(nomeUsuario); %></h1>
        <h2>Perfil Administrador</h2>
        <br>
        <%
            List<Cadastro> lprod = (List<Cadastro>) request.getAttribute("lprod");

        %>

        <table class="table table-hover table-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Data de Nascimento</th>
                <th>Sexo</th>
                <th>Senha</th>
                <th>Perfil</th>
                <th>Editar</th>
                <th>Excluír</th>
            </tr>

            <% if (lprod != null) {

                    for (Cadastro p : lprod) {%>
            <tr>                
                <td><%out.print(p.getId());%></td>
                <td><%out.print(p.getNome());%></td>  
                <td><%out.print(p.getEmail());%></td>  
                <td><%out.print(p.getData());%></td>  
                <td><%out.print(p.getSexo());%></td>  
                <td><%out.print(p.getSenha());%></td>  
                <td><%out.print(p.getPerfil());%></td>  
                <td><a href="http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=Editar&id=<%out.print(p.getId());%>"><img src="Imagens/Edit1.png" height="40px" width="40px"></a></td>
                <td><a href="http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=Deletar&id=<%out.print(p.getId());%>"><img src="Imagens/Lixeira.png" height="40px" width="40px"></a></td>
            </tr>
            <%}
                }%>
        </table>
    </body>
</html>
