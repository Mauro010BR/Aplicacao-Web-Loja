
package controller;

import DAO.CadastroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cadastro;


@WebServlet(name = "Controle_Cadastro", urlPatterns = {"/Controle_Cadastro"})
public class Controle_Cadastro extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            CadastroDAO dao = new CadastroDAO();

            String op = request.getParameter("op");

            if (op.equals("Cadastrar")) {
                String email = request.getParameter("email");
                String nome = request.getParameter("nome");
                String data = request.getParameter("data");
                String sexo = request.getParameter("sexo");
                String senha = request.getParameter("senha");

                Cadastro cad = new Cadastro(email, nome, data, sexo, senha);

                try {
                    dao.cadastrar(cad);
                    response.sendRedirect("http://localhost:8080/ProjetoLoja/login.jsp");

                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro" + ex.getMessage());
                }

            } else if (op.equals("Logar")) {
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");

                Cadastro cad = new Cadastro();
                cad.setEmail(email);
                cad.setSenha(senha);

                try {
                    cad = dao.consultarLogin(cad);

                    if (cad.getEmail() == null) {
                        String erro = "E-Mail ou Senha inválidos!";
                        request.setAttribute("erro", erro);
                        request.getRequestDispatcher("login.jsp").forward(request, response);

                    } else if (cad.getPerfil().equals("adm")) {
                        String perfil = cad.getPerfil();
                        String nome = cad.getNome();
                        request.setAttribute("nome", nome);
                        request.setAttribute("adm", perfil);
                        request.getRequestDispatcher("valida_adm.jsp").forward(request, response);

                    } else if (cad.getPerfil().equals("cliente")) {
                        String perfil = cad.getPerfil();
                        int id = cad.getId();
                        String nome = cad.getNome();
                        
                        request.setAttribute("nome",nome);
                        request.setAttribute("perfil", perfil);
                        request.setAttribute("id", id);
                        request.getRequestDispatcher("valida_cliente.jsp").forward(request, response);

                    }
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro" + ex.getMessage());

                }
            } else if (op.equals("ConsultarTodos")) {
                try {
                    List<Cadastro> lprod = dao.consultarTodos();
                    request.setAttribute("lprod", lprod);
                    request.getRequestDispatcher("Cadastros.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                }
            } else if (op.equals("Deletar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Cadastro cad = new Cadastro();
                cad.setId(id);
                try {
                    dao.deletar(cad);
                    response.sendRedirect("http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=ConsultarTodos");
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                }
            } else if (op.equals("Editar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Cadastro cad = new Cadastro();
                cad.setId(id);
                try {
                    cad = dao.consultarById(cad);
                    request.setAttribute("cadastro_id", cad);
                    request.getRequestDispatcher("alterar_cadastro.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                }
            } else if (op.equals("Salvar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String email = request.getParameter("email");
                String nome = request.getParameter("nome");
                String data = request.getParameter("data");
                String sexo = request.getParameter("sexo");
                String perfil = request.getParameter("perfil");
                String senha = request.getParameter("senha");

                Cadastro cad = new Cadastro();
                
                cad.setId(id);
                cad.setEmail(email);
                cad.setNome(nome);
                cad.setData(data);
                cad.setSexo(sexo);
                cad.setPerfil(perfil);
                cad.setSenha(senha);

                dao.editar(cad);
                response.sendRedirect("http://localhost:8080/ProjetoLoja/Controle_Cadastro?op=ConsultarTodos");
            } else if(op.equals("BuscarID")){
                int id = Integer.parseInt(request.getParameter("id"));
                 Cadastro cad = new Cadastro();        
                 cad.setId(id);
                 
                try {
                    cad = dao.consultarById(cad);
                    if(cad.getEmail() == null){
                        String invalido = "ID não existente!";
                        request.setAttribute("validar",invalido);
                        request.getRequestDispatcher("Consultar.jsp").forward(request, response);
                    } else{
                    request.setAttribute("busca", cad);
                    request.getRequestDispatcher("Consultar.jsp").forward(request, response);
                    }
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                }
            }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controle_Cadastro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Controle_Cadastro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controle_Cadastro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Controle_Cadastro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
