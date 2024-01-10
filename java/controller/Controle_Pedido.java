
package controller;

import DAO.PedidoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cadastro;
import model.Pedido;


@WebServlet(name = "Controle_Pedido", urlPatterns = {"/Controle_Pedido"})
public class Controle_Pedido extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            PedidoDAO dao = new PedidoDAO();
            
            String op = request.getParameter("op");
            
            if (op.equals("Comprar")) {
                int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                String produto = request.getParameter("produto");
                String preco = request.getParameter("preco");
                String tamanho = request.getParameter("tamanho");
                String cor = request.getParameter("cor");

                Pedido ped = new Pedido(idCliente,produto,preco,tamanho,cor);

                try {
                    dao.cadastrar(ped);
                    response.sendRedirect("http://localhost:8080/ProjetoLoja/tela_pedido.jsp");

                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro" + ex.getMessage());
                }

            }
            
            else if (op.equals("ConsultarTodos")) {
                int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                Pedido ped = new Pedido();            
                ped.setId_cliente(idCliente);
                
                try {
                    List<Pedido> lprod = dao.consultarTodos(ped);               
                    Pedido valor = new Pedido();
                    valor = dao.valorTotal(ped);
                    
                    request.setAttribute("valor",valor);
                    request.setAttribute("lprod", lprod);
                    request.getRequestDispatcher("Pedidos.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                }
            }
            else if (op.equals("Deletar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Pedido ped = new Pedido();
                ped.setId(id);
                try {
                    dao.deletar(ped);
                    response.sendRedirect("http://localhost:8080/ProjetoLoja/tela.jsp");
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                }
            }
            
            else if (op.equals("Editar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Pedido ped = new Pedido();
                ped.setId(id);
                try {
                    ped = dao.consultarById(ped);
                    request.setAttribute("pedido_id", ped);
                    request.getRequestDispatcher("alterar_pedido.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                }
            }
            
             else if (op.equals("Salvar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String produto = request.getParameter("produto");
                String preco = request.getParameter("preco");
                String tamanho = request.getParameter("tamanho");
                String cor = request.getParameter("cor");

                Pedido ped = new Pedido();
                
                ped.setId(id);
                ped.setProduto(produto);
                ped.setPreco(preco);
                ped.setTamanho(tamanho);
                ped.setCor(cor);

                dao.editar(ped);
                response.sendRedirect("http://localhost:8080/ProjetoLoja/tela_edit.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
