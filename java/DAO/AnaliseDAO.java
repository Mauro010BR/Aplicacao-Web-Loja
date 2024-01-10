
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Analise;
import model.Cadastro;
import util.Conexao;


public class AnaliseDAO {

    public ArrayList<Analise> consultarMaioresVendas() throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        String query = "SELECT \n"
                + "		b.id,\n"
                + "        UPPER(b.nome) as nome,\n"
                + "        sum(a.preco) as \"valor_compra\"\n"
                + "	FROM tb_pedidos as a\n"
                + "		JOIN tb_usuarios as b ON a.id_cliente = b.id\n"
                + "    GROUP BY b.id,b.nome\n"
                + "		ORDER BY valor_compra DESC";
        PreparedStatement comando = con.prepareStatement(query);
        ResultSet rs = comando.executeQuery();

        ArrayList<Analise> lprod = new ArrayList<Analise>();
        while (rs.next()) {
            Analise cmv = new Analise();
            cmv.setId(rs.getInt("id"));
            cmv.setNome(rs.getString("nome"));
            cmv.setValor(rs.getInt("valor_compra"));

            lprod.add(cmv);
        }
        return lprod;
    }

    public ArrayList<Analise> consultarCompras() throws SQLException, ClassNotFoundException {
        Connection con = Conexao.getConexao();
        String query = "SELECT\n"
                + "	UPPER(NOME) AS CLIENTE\n"
                + "    ,EMAIL\n"
                + "    ,COUNT(PRODUTO) AS QUANTIDADE\n"
                + "    FROM TB_PEDIDOS AS A\n"
                + "		JOIN TB_USUARIOS AS B ON A.ID_CLIENTE = B.ID\n"
                + "	GROUP BY NOME\n"
                + "		ORDER BY QUANTIDADE DESC";
        PreparedStatement comando = con.prepareStatement(query);
        ResultSet rs = comando.executeQuery();

        ArrayList<Analise> lprod = new ArrayList<Analise>();
        while (rs.next()) {
            Analise cc = new Analise();
            cc.setNome(rs.getString("CLIENTE"));
            cc.setEmail(rs.getString("EMAIL"));
            cc.setQuantidade(rs.getInt("QUANTIDADE"));

            lprod.add(cc);
        }
        return lprod;
    }

    public ArrayList<Analise> produtosMaisVendidos() throws SQLException, ClassNotFoundException {
        Connection con = Conexao.getConexao();
        String query = "SELECT \n"
                + "	UPPER(PRODUTO) AS PRODUTO\n"
                + "    ,AVG(TAMANHO) AS TAMANHO\n"
                + "	,COUNT(PRODUTO) AS QUANTIDADE\n"
                + "    FROM TB_PEDIDOS AS A\n"
                + "		JOIN TB_USUARIOS AS B ON A.ID_CLIENTE = B.ID\n"
                + "	GROUP BY PRODUTO\n"
                + "	ORDER BY QUANTIDADE DESC";
        PreparedStatement comando = con.prepareStatement(query);
        ResultSet rs = comando.executeQuery();

        ArrayList<Analise> lprod = new ArrayList<Analise>();
        while (rs.next()) {
            Analise pmv = new Analise();
            pmv.setProduto(rs.getString("PRODUTO"));
            pmv.setTamanho(rs.getString("TAMANHO"));
            pmv.setQuantidade(rs.getInt("QUANTIDADE"));

            lprod.add(pmv);
        }
        return lprod;
    }

}
