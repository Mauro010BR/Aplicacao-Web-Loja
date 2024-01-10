<%
    String validaAdm = (String) request.getAttribute("adm");
    String nomeUsuario = (String) request.getAttribute("nome");
    session.setAttribute("validaAdm", validaAdm);
    session.setAttribute("nomeUsuario",nomeUsuario);
    response.sendRedirect("http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=ConsultarTodos");
%>