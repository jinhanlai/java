package dao;

import entit.Student;
import java.sql.*;

public class Mysql_insert extends MysqlConnect{

    private String sql_insert = "insert into studentinfo(studentId,name,gender,birthday,classname,major,height,weight,photo)values(?,?,?,?,?,?,?,?,?)";
    public Mysql_insert() {
        super();
    }

    public  synchronized int insertMysql(String sql, Student s1) {
        if (Query(sql) == 1) { //数据库中无记录，则插入
            try {
                ps = con.prepareStatement(sql_insert);
                ps.setString(1, s1.getStudenId());
                ps.setString(2, s1.getName());
                ps.setString(3, s1.getGender());
                ps.setDate(4, Date.valueOf(s1.getBirthday()));
                ps.setString(5, s1.getClassname());
                ps.setString(6, s1.getMajor());
                ps.setString(7, s1.getHeight());
                ps.setString(8, s1.getWeight());
                ps.setString(9, s1.getPhoto());
                int n = ps.executeUpdate();//执行插入操作
                if (n == 1) {
                    return 1;//表示插入成功
                } else {
                    return -1;//表示插入失败
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            closeAll();
        }
        return 0;////表示学生学号已经存在，不能重复插入相同的学号

    }
}
