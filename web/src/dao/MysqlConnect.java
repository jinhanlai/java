package dao;

import java.sql.*;

public class MysqlConnect {
    public String URL = "jdbc:mysql://localhost:3306/stuinfo?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    public Connection con = null;
    public Statement stat = null;
    public ResultSet rs = null;
    public PreparedStatement ps = null;
    public MysqlConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.con = DriverManager.getConnection(URL, "root", "102255");
            stat = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int Query(String sql) { //查询数据库是否有记录
        try {
            rs = stat.executeQuery(sql); //执行sql语句，查询结果
            if (rs.next()) {
                return 0;//数据库中有记录
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 1;//数据库中无记录
    }
    public void Delete(String id) { //按id删除数据库记录
        String sql = "delete from studentinfo where studentId=?";
        try {
            ps =con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
            closeAll();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public void closeAll() {
        try {
            if (ps != null)
                ps.close();
            if (rs != null)
                rs.close();
            if (stat != null)
                stat.close();
            if (con != null)
                con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
