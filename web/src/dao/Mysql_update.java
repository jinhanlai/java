package dao;

import entit.Student;

import java.sql.Date;

public class Mysql_update extends MysqlConnect {

    public Mysql_update() {
        super();
    }

    public synchronized int updateMysql(String sql_update, Student s1) {
        try {
            ps = con.prepareStatement(sql_update);
            ps.setString(1, s1.getName());
            ps.setString(2, s1.getGender());
            ps.setDate(3, Date.valueOf(s1.getBirthday()));
            ps.setString(4, s1.getClassname());
            ps.setString(5, s1.getMajor());
            ps.setString(6, s1.getHeight());
            ps.setString(7, s1.getWeight());
            ps.setString(8, s1.getPhoto());
            int n = ps.executeUpdate();//执行插入操作
            if (n == 1) {
                return 1;//表修改成功
            } else {
                return -1;//表示修改失败
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeAll();

        return 0;//表示失败

    }

}
