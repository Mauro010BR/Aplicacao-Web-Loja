
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            body{
                background-image: url(Imagens/Jordan1.jpg);
                
                
            }
            .erro{
                position: absolute;
                top: 57%;
                left: 25%;
            }

            .login-container{
                position:fixed;
                top:20%;
                left: 32%;
            }
            .login-form-1{
                padding: 5%;
                background: white;
                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-1 h3{
                text-align: center;
                color: #333;
            }

            .login-container form{
                padding: 10%;
            }
            .btnSubmit
            {
                width: 50%;
                border-radius: 1rem;
                padding: 1.5%;
                border: none;
                cursor: pointer;
            }
            .login-form-1 .btnSubmit{
                font-weight: 600;
                color: #fff;
                margin-left: 25%;
                background-color: black;
            }

            .login-form-1 .ForgetPwd{
                color: #0062cc;
                font-weight: 600;
                text-decoration: none;
            }
            img{
                position: absolute;
                top: 7%;
                left: 45%;
            }

        </style>
    </head>
    <body>
        <div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                    <br><br>
                    <h3>Acesse sua Conta</h3>
                    <img src="Imagens/logo.png" alt="Logo" width="65" height="60">
                    <form action="Controle_Cadastro" method="POST">
                        <div class="form-group">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Insira seu E-mail" required/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="senha" name="senha" placeholder="Insira sua Senha" required/>
                        </div>
                        <div class="form-group">
                            <a href="http://localhost:8080/ProjetoLoja/index.html" class="ForgetPwd">Cadastre-se</a>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" id="op" name="op" value="Logar"/>
                        </div>
                    </form>
                </div>
                <div class="erro">
                    <%
                        String erro = (String) request.getAttribute("erro");
                        if (erro != null) {
                            out.println(erro);
                        }
                    %>
                </div>

                </body>
                </html>

