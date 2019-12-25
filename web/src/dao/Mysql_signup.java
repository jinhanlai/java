package dao;

import entit.Student;

import java.sql.Date;

public class Mysql_signup extends MysqlConnect {
    String sql_signup = "insert into login(account,password)values(?,?)";

    public Mysql_signup() {
        super();
    }

    public synchronized int signupMysql(String sql_query, String account,String password) {
        if (Query(sql_query) == 1) { //数据库中无记录，则插入
            try {
                ps = con.prepareStatement(sql_signup);
                ps.setString(1, account);
                ps.setString(2,password);
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
