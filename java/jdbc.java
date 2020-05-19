import java.sql.*;

public class jdbc {
	// MySQL 8.0 以下
	//static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	//static final String DB_URL = "jdbc:mysql://localhost:3306/zmx";
	
	// MySQL 8.0 及以上
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/zmx?useSSL=false&serverTimezone=UTC";

	// sql server
	//static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//static final String DB_URL = "jdbc:sqlserver://localhost:1433; DatabaseName=zmx";

	static final String USER = "zmx"; // ubuntu mariadb 用 root 连接会出错
	static final String PASSWORD = "";

	public static void main (String[] args) {
		Connection conn = null;
		Statement stmt = null;
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
			ResultSet res = stmt.executeQuery(sql);

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

			res.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// 处理 JDBC 错误
			e.printStackTrace();
		} catch (Exception e) {
			// 处理 Class.forName 错误
			e.printStackTrace();
		} finally {
			// 关闭资源
			try {
				if (stmt != null) stmt.close();
			} catch (SQLException e) {
				// 什么都不做
			} 
			try {
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("bye!");
	}
}
