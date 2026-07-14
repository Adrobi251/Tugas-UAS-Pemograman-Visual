package uas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

public class Koneksi {
    private static Connection mysqlconfig;
    
    public static Connection getConnection() {
        if (mysqlconfig == null) {
            try {
                String url = "jdbc:mysql://localhost:3306/db_kursus";
                String user = "root";
                String pass = "";
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                mysqlconfig = DriverManager.getConnection(url, user, pass);
                
                // Auto-seed data kursus if empty
                try (Statement st = mysqlconfig.createStatement()) {
                    ResultSet rs = st.executeQuery("SELECT COUNT(*) AS total FROM kursus");
                    if (rs.next() && rs.getInt("total") == 0) {
                        st.executeUpdate("INSERT INTO kursus (nama_kursus, harga) VALUES ('Microsoft Office', 500000)");
                        st.executeUpdate("INSERT INTO kursus (nama_kursus, harga) VALUES ('Belajar Design', 750000)");
                        st.executeUpdate("INSERT INTO kursus (nama_kursus, harga) VALUES ('Belajar Coding', 1000000)");
                    }
                } catch (SQLException e) {
                    System.out.println("Gagal auto-seed kursus: " + e.getMessage());
                }
                
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Koneksi Database Gagal: " + e.getMessage());
            }
        }
        return mysqlconfig;
    }
}
