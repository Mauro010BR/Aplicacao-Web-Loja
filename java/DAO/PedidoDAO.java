
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cadastro;
import model.Pedido;
import util.Conexao;


public class PedidoDAO {

    public void cadastrar(Pedido ped) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("INSERT INTO tb_pedidos (id_cliente,produto,preco,tamanho,cor) VALUES (?,?,?,?,?)");
        comando.setInt(1, ped.getId_cliente());
        comando.setString(2, ped.getProduto());
        comando.setString(3, ped.getPreco());
        comando.setString(4, ped.getTamanho());
        comando.setString(5, ped.getCor());

        comando.execute();
        con.close();

    }

    public ArrayList<Pedido> consultarTodos(Pedido ped) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from tb_pedidos where id_cliente = ?");
        comando.setInt(1, ped.getId_cliente());

        ResultSet rs = comando.executeQuery();

        ArrayList<Pedido> lprod = new ArrayList<Pedido>();
        while (rs.next()) {
            Pedido pedido = new Pedido();
            pedido.setId(rs.getInt("id"));
            pedido.setProduto(rs.getString("produto"));
            pedido.setCor(rs.getString("cor"));
            pedido.setTamanho(rs.getString("tamanho"));
            pedido.setPreco(rs.getString("preco"));

            lprod.add(pedido);
        }
        return lprod;
    }

    public Pedido valorTotal(Pedido ped) throws SQLException, ClassNotFoundException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select SUM(cast(preco as unsigned integer)) as \"somar\"\n"
                + "	from tb_pedidos\n"
                + "    group by id_cliente\n"
                + "    having id_cliente = ?");
        comando.setInt(1, ped.getId_cliente());

        ResultSet rs = comando.executeQuery();
        Pedido pedido = new Pedido();

        if (rs.next()) {
            pedido.setValor(rs.getInt("somar"));
        }
        con.close();
        return pedido;
    }

    public void deletar(Pedido ped) throws ClassNotFoundException, SQLException {
        try (Connection con = Conexao.getConexao()) {
            PreparedStatement comando = con.prepareStatement("DELETE FROM tb_pedidos WHERE id = ?");
            comando.setInt(1, ped.getId());
            comando.execute();
            comando.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro ClassNotFound: " + ex.getMessage());
        }
    }

    public Pedido consultarById(Pedido cad) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from tb_pedidos where id = ?");
        comando.setInt(1, cad.getId());
        ResultSet rs = comando.executeQuery();
        Pedido p = new Pedido();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setId_cliente(rs.getInt("id_cliente"));
            p.setProduto(rs.getString("produto"));
            p.setPreco(rs.getString("preco"));
            p.setTamanho(rs.getString("tamanho"));
            p.setCor(rs.getString("cor"));
        }
        con.close();
        return p;
    }

    public void editar(Pedido ped) {
        try {
            Connection con = Conexao.getConexao();
            PreparedStatement comando = con.prepareStatement("UPDATE tb_pedidos\n"
                    + "SET produto = ?, preco = ?, tamanho = ?, cor = ?\n"
                    + "WHERE id = ?");
            comando.setString(1, ped.getProduto());
            comando.setString(2, ped.getPreco());
            comando.setString(3, ped.getTamanho());
            comando.setString(4, ped.getCor());
            comando.setInt(5,ped.getId());
            comando.execute();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro ClassNotFound: " + ex.getMessage());
        }
    }

}
