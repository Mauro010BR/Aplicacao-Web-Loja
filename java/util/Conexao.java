
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexao {
    public static Connection getConexao() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        String URL = "jdbc:mysql://localhost:3306/projeto";
        String user = "root";
        String password = "";
        
        return DriverManager.getConnection(URL,user,password);
    }
}
