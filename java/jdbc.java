import java.sql.*;
//import oracle.jdbc.driver.OracleDriver;
//import java.util.Properties;

public class jdbc {

	static final String USER = "zmx"; // ubuntu mariadb 用 root 连接会出错
	static final String PASSWORD = "";

	// MySQL 8.0 及以上
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/zmx?useSSL=false&serverTimezone=UTC";

	// MySQL 8.0 以下
	//static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	//static final String DB_URL = "jdbc:mysql://localhost:3306/zmx";
	
	// sql server
	//static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//static final String DB_URL = "jdbc:sqlserver://localhost:1433; DatabaseName=zmx";

	// oracle
	//static final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	//static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	public static void main (String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet res = null;
		try {
			// 注册 JDBC 驱动
			Class.forName(JDBC_DRIVER);

			// 打开链接
			System.out.println("连接数据库...");
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

			// 执行查询
			System.out.println("实例化 Statement 对象...");
			stmt = conn.createStatement();
			String sql = "select id, name, url from websites";
			res = stmt.executeQuery(sql);

			/* 另一种写法
			Driver driver = new OracleDriver();
			DriveManager.deregisterDriver(driver);
			Properties pro = new Properties();
			pro.put("user", username);
			pro.put("password", password);
			conn = driver.connect("jdbc:oracle:thin:@localhost:1521:XE", pro);
			PreparedStatement preState = conn.PreparedStatement(sql);
			boolean execute = preState.execute();
			System.out.println(execute);
			*/

			// 显示结果集
			while (res.next()) {
				// 通过字段检索
				int id = res.getInt("id");
				String name = res.getString("name");
				String url = res.getString("url");
				// 输出
				System.out.print("ID: " + id);
				System.out.print(", 站点: " + name);
				System.out.print(", URL: " + url);
				System.out.print("\n");
			}

		} catch (SQLException e) {
			// 处理 JDBC 错误
			e.printStackTrace();
		} catch (Exception e) {
			// 处理 Class.forName 错误
			e.printStackTrace();
		} finally {
			// 关闭资源
			try {
				if (res != null)
					res.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("bye!");
	}
}
