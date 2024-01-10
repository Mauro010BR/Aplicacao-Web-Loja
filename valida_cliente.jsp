<%
    String validaCliente = (String) request.getAttribute("perfil");
    session.setAttribute("validaCliente", validaCliente);
    int idCliente = (int) request.getAttribute("id");
    session.setAttribute("idCliente", idCliente);
    String nome = (String) request.getAttribute("nome");
    session.setAttribute("nome",nome);
    response.sendRedirect("http://localhost:8080/ProjetoLoja/Catalogo.jsp");
%>