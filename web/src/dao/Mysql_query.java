package dao;
import entit.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Mysql_query extends MysqlConnect {


    public Mysql_query() {
        super();
    }


    public  int get_latRow(String sqlAll) {
        int lastRow=0;
        try {
            ResultSet rsAll = stat.executeQuery(sqlAll);
            rsAll.last();
            lastRow = rsAll.getRow();//记录数据库最后一行
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  lastRow;
    }
    public  List<Student> query(String sql_limit) {
        List<Student> studs = new ArrayList<Student>();
        try {
            Statement stat_limit = con.createStatement();
            rs = stat_limit.executeQuery(sql_limit);
            while (rs.next()) {
                studs.add(new Student(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(8),
                        rs.getString(9), rs.getString(7)));
            }
            stat_limit.close();
            closeAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studs;
    }
}

