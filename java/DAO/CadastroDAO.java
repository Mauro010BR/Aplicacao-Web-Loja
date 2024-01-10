
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cadastro;
import util.Conexao;


public class CadastroDAO {

    public void cadastrar(Cadastro cad) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("INSERT INTO tb_usuarios (email,nome,nascimento,sexo,senha) VALUES (?,?,?,?,?)");
        comando.setString(1, cad.getEmail());
        comando.setString(2, cad.getNome());
        comando.setString(3, cad.getData());
        comando.setString(4, cad.getSexo());
        comando.setString(5, cad.getSenha());

        comando.execute();
        con.close();

    }

    public Cadastro consultarLogin(Cadastro cad) throws SQLException, ClassNotFoundException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from tb_usuarios where email = ? and senha = ?");
        comando.setString(1, cad.getEmail());
        comando.setString(2, cad.getSenha());

        ResultSet rs = comando.executeQuery();
        Cadastro c = new Cadastro();

        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setEmail(rs.getString("email"));
            c.setNome(rs.getString("nome"));
            c.setData(rs.getString("nascimento"));
            c.setSexo(rs.getString("sexo"));
            c.setSenha(rs.getString("senha"));
            c.setPerfil(rs.getString("perfil"));
        }
        con.close();
        return c;
    }

    public ArrayList<Cadastro> consultarTodos() throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from tb_usuarios");
        ResultSet rs = comando.executeQuery();

        ArrayList<Cadastro> lprod = new ArrayList<Cadastro>();
        while (rs.next()) {
            Cadastro cad = new Cadastro();
            cad.setId(rs.getInt("id"));
            cad.setEmail(rs.getString("email"));
            cad.setNome(rs.getString("nome"));
            cad.setData(rs.getString("nascimento"));
            cad.setSexo(rs.getString("sexo"));
            cad.setSenha(rs.getString("senha"));
            cad.setPerfil(rs.getString("perfil"));

            lprod.add(cad);
        }
        return lprod;
    }

    public void deletar(Cadastro cad) throws ClassNotFoundException, SQLException {
        try (Connection con = Conexao.getConexao()) {
            PreparedStatement comando = con.prepareStatement("DELETE FROM tb_usuarios WHERE id = ?");
            comando.setInt(1, cad.getId());
            comando.execute();
            comando.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro ClassNotFound: " + ex.getMessage());
        }
    }

    public void editar(Cadastro cad) {
        try {
            Connection con = Conexao.getConexao();
            PreparedStatement comando = con.prepareStatement("update tb_usuarios\n"
                    + "set email = ?, nome = ?, nascimento = ?, sexo = ?, senha = ?, perfil = ?\n"
                    + "where id = ?; ");
            comando.setString(1, cad.getEmail());
            comando.setString(2, cad.getNome());
            comando.setString(3, cad.getData());
            comando.setString(4, cad.getSexo());
            comando.setString(5, cad.getSenha());
            comando.setString(6,cad.getPerfil());
            comando.setInt(7,cad.getId());

            comando.execute();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro ClassNotFound: " + ex.getMessage());
        }
    }
    
     public Cadastro consultarById(Cadastro cad) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from tb_usuarios where id = ?");
        comando.setInt(1, cad.getId());
        ResultSet rs = comando.executeQuery();
        Cadastro p = new Cadastro();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setEmail(rs.getString("email"));
            p.setNome(rs.getString("nome"));
            p.setData(rs.getString("nascimento"));
            p.setSexo(rs.getString("sexo"));
            p.setSenha(rs.getString("senha"));
            p.setPerfil(rs.getString("perfil"));
        }
        con.close();
        return p;
    }

}
