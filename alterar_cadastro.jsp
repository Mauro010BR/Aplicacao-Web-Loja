
<%@page import="model.Cadastro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%     String perfil = (String) session.getAttribute("validaAdm");
    if (perfil == null) {
        response.sendRedirect("http://localhost:8080/ProjetoLoja/login.jsp");
    }%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body{
                background-image: url(Imagens/Jordan2.jpg);
                
                
            }
             .botao{
                position: absolute;
                top: 56.3%;
                left: 54%;
                transform: translate(-50%, -50%);
                fill: white;
			stroke: white;
			filter: drop-shadow(0 0 10px white)  drop-shadow(0 0 200px white) ;
            }
            .botao1{
                position: absolute;
                top: 53%;
                left: 44%;
                transform: translate(-50%, -50%);
                fill: white;
			stroke: white;
			filter: drop-shadow(0 0 10px white)  drop-shadow(0 0 200px white) ;
            }
            a{
                position: absolute;
                top: 37%;
                left: 0.25%;

            }
            h1{
                text-align: center;
            }

        </style>
    </head>
    <body>
        <br>
        <h1>Alterar Cadastro:</h1>
        <br>
        <%
            Cadastro cad = (Cadastro) request.getAttribute("cadastro_id");
        %>

        <form action="Controle_Cadastro" method="post"> 
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="nome">Nome: </label>
                    <input type="text" class="form-control" name="nome" id="nome" value="<% out.print(cad.getNome()); %>">
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Email: </label>
                    <input type="email" class="form-control" name="email" id="email" value="<% out.print(cad.getEmail()); %>">
                </div>
                <div class="form-group col-md-6"> 
                    <label for="data">Data de Nascimento: </label>
                    <input type="date" class="form-control" name="data" id="data" value="<% out.print(cad.getData()); %>">
                </div>
                <div class="form-group col-md-6">
                    <label for="sexo">Sexo: </label>
                    <select name="sexo" id="sexo" class="form-control">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select>
                </div>
                 <div class="form-group col-md-6">
                    <label for="sexo">Perfil: </label>
                    <select name="perfil" id="perfil" class="form-control">
                        <option value="cliente">Cliente</option>
                        <option value="adm">Administrador</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="senha">Senha: </label>
                    <input type="text" class="form-control" name="senha" id="senha" value="<% out.print(cad.getSenha());%>">
                </div>
                <div class="botao">
                    <input type="submit" class="btn btn-secondary btn-lg btn-block" id="op" name="op" value="Salvar">
                </div>
                <div class="botao1">
                    <a class="btn btn-danger btn-lg" href="http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=ConsultarTodos">Voltar</a>
                </div>
            </div>
            <input type="hidden" name="id" id="id" value="<% out.print(cad.getId()); %>">
        </form>
    </body>
</html>
