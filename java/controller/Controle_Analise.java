
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Analise;
import DAO.AnaliseDAO;



@WebServlet(name = "Controle_Analise", urlPatterns = {"/Controle_Analise"})
public class Controle_Analise extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            AnaliseDAO dao = new AnaliseDAO();

            String op = request.getParameter("op");
            
            if (op.equals("consultarAnalise")) {
                try {
                    List<Analise> consultarMaioresVendas = dao.consultarMaioresVendas();
                    request.setAttribute("MaioresVendas", consultarMaioresVendas);
                    
                    List<Analise> consultarQuantidadeVendas = dao.consultarCompras();
                    request.setAttribute("QuantidadeVendas", consultarQuantidadeVendas);
                    
                    List<Analise> produtosMaisVendidos = dao.produtosMaisVendidos();
                    request.setAttribute("ProdutosMaisVendidos", produtosMaisVendidos);
                    
                    request.getRequestDispatcher("Analises.jsp").forward(request, response);
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
