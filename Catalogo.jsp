
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String perfil = (String) session.getAttribute("validaCliente");

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
            li {
                list-style-type: none;
            }
            .card1{
                position: relative;
                top: 80%;
                left: 5%;
            }
            .card2{
                position: absolute;
                top: 45.74%;
                left: 29%;
            }
            .card3{
                position: absolute;
                top: 45.74%;
                left: 53%;
            }
            .card4{
                position: absolute;
                top: 45.74%;
                left: 77%;
            }
            .video{
                position: relative;
                top: 80%;
                left: 22%;
            }
            .text{
                position: relative;
                top: 90%;
                left: 17%;
            }
            label,p,h5,li,select{
                text-align: center;
            }
            body{
                background-image: url(Imagens/Wallpaper.jpg);
            }
            h1{
                color: white;
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
        <div class="carousel-inner">
            <!-- Single item -->
            <div class="video">
                <video class="img-fluid" autoplay loop muted>
                    <source src="Imagens/JordanPropaganda1.mp4" type="video/mp4"/>
                </video>
                <div class="text">
                    <h1>Torne-se um Jogador!</h1>
                    <p>
                        .                    </p>
                </div>
            </div>
            <div class="card1">
                <div class="card" style="width: 18rem;">
                    <img class="card -img-top" src="Imagens/Tenis1.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Air Jordan 1</h5>
                        <p class="card-text">Primeiro Tênis da linha Jordan</p>
                    </div>
                    <form action="Controle_Pedido">
                        <ul class="list-group list-group-flush">
                            <input type="hidden" id="idCliente" name="idCliente" value="<% out.print(idCliente); %>">
                            <input type="hidden" id="produto" name="produto" value="Air Jordan 1">
                            <input type="hidden" id="preco" name="preco" value="1500">
                            <li class="list-group-item">Preço: 1.500,00 R$</li>
                            <label for="tamanho">Tamanho:</label>
                            <select name="tamanho" id="tamanho" class="form-control" required>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="42">42</option>
                                <option value="43">43</option>
                                <option value="44">44</option>
                            </select>
                            <label for="cor">Cor:</label>
                            <select name="cor" id="cor" class="form-control" required>
                                <option value="Preto">Preto</option>
                                <option value="Branco">Branco</option>
                                <option value="Cinza">Cinza</option>
                            </select>
                        </ul>
                        <div class="card-body">
                            <input class="btn btn-secondary btn-lg btn-block" type="submit" id="op" name="op" value="Comprar">
                        </div>
                    </form>
                </div>
            </div>
            <div class="card2">
                <div class="card" style="width: 18rem;">
                    <img class="card -img-top" src="Imagens/Tenis2.jpeg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Air Jordan 4 Retro</h5>
                        <p class="card-text">Edição de 2019 do Air Jordan 4 </p>
                    </div>
                    <form action="Controle_Pedido">
                        <ul class="list-group list-group-flush">
                            <input type="hidden" id="idCliente" name="idCliente" value="<% out.print(idCliente); %>">
                            <input type="hidden" id="produto" name="produto" value="Air Jordan 4 Retro">
                            <input type="hidden" id="preco" name="preco" value="1699">
                            <li class="list-group-item">Preço: 1.699,00 R$</li>
                            <label for="tamanho">Tamanho:</label>
                            <select name="tamanho" id="tamanho" class="form-control" required>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="42">42</option>
                                <option value="43">43</option>
                                <option value="44">44</option>
                            </select>
                            <label for="cor">Cor:</label>
                            <select name="cor" id="cor" class="form-control" required>
                                <option value="Preto">Preto</option>
                                <option value="Branco">Branco</option>
                                <option value="Cinza">Cinza</option>
                            </select>
                        </ul>
                        <div class="card-body">
                            <input class="btn btn-secondary btn-lg btn-block" type="submit" id="op" name="op" value="Comprar">
                        </div>
                    </form>
                </div>
            </div>
            <div class="card3">
                <div class="card" style="width: 18rem;">
                    <img class="card -img-top" src="Imagens/Tenis3.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Air Jordan 6 Retro</h5>
                        <p class="card-text">Edição dark retrô</p>
                    </div>
                    <form action="Controle_Pedido">
                        <ul class="list-group list-group-flush">
                            <input type="hidden" id="idCliente" name="idCliente" value="<% out.print(idCliente); %>">
                            <input type="hidden" id="produto" name="produto" value="Air Jordan 6 Retro">
                            <input type="hidden" id="preco" name="preco" value="1099">
                            <li class="list-group-item">Preço: 1.099,00 R$</li>
                            <label for="tamanho">Tamanho:</label>
                            <select name="tamanho" id="tamanho" class="form-control" required>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="42">42</option>
                                <option value="43">43</option>
                                <option value="44">44</option>
                            </select>
                            <label for="cor">Cor:</label>
                            <select name="cor" id="cor" class="form-control" required>
                                <option value="Preto">Preto</option>          
                                <option value="Branco">Branco</option>
                                <option value="Cinza">Cinza</option>
                            </select>
                        </ul>
                        <div class="card-body">
                            <input class="btn btn-secondary btn-lg btn-block" type="submit" id="op" name="op" value="Comprar">
                        </div>
                    </form>
                </div>
            </div>
            <div class="card4">
                <div class="card" style="width: 18rem;">
                    <img class="card -img-top" src="Imagens/Tenis4.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Air Jordan 3 Retro</h5>
                        <p class="card-text">Versão Retrô de 1988</p>
                    </div>
                    <form action="Controle_Pedido">
                        <ul class="list-group list-group-flush">
                            <input type="hidden" id="idCliente" name="idCliente" value="<% out.print(idCliente); %>">
                            <input type="hidden" id="produto" name="produto" value="Air Jordan 3 Retro">
                            <input type="hidden" id="preco" name="preco" value="3200">
                            <li class="list-group-item">Preço: 3.200,00 R$</li>
                            <label for="tamanho">Tamanho:</label>
                            <select name="tamanho" id="tamanho" class="form-control" required>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="42">42</option>
                                <option value="43">43</option>
                                <option value="44">44</option>
                            </select>
                            <label for="cor">Cor:</label>
                            <select name="cor" id="cor" class="form-control" required>
                                <option value="Preto">Preto</option>
                                <option value="Branco">Branco</option>
                                <option value="Cinza">Cinza</option>
                            </select>
                        </ul>
                        <div class="card-body">
                            <input class="btn btn-secondary btn-lg btn-block" type="submit" id="op" name="op" value="Comprar">
                        </div>
                    </form>
                </div>
            </div>
            <br>
            <% }%>
            </body>
            </html>
