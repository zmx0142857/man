import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Dao {
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://127.0.0.1:3306/<dbname>";
    private static final String user = "zmx";
    private static final String password = "";

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    public static void closeAll(Connection conn, Statement stmt, ResultSet rs) throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public int executeSQL(String preparedSql, Object[] param) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(preparedSql);
            if (param != null) {
                for (int i = 0; i < param.length; ++i) {
                    pstmt.setObject(i + 1, param[i]);
                }
            }
            ResultSet res = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                Dao.closeAll(conn, pstmt, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
}

class Pet {
    private Integer id;
    private Integer ownerId; // 主人 ID
    private Integer storeId; // 商店 ID
    private String name;     // 姓名
    private String typeName; // 类型
    private int health;      // 健康
    private int love;        // 爱心值
    private Date birthday;   // 生日

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    public int getLove() {
        return love;
    }

    public void setLove(int love) {
        this.love = love;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}

interface PetDao {
    List<Pet> findAllPets() throws Exception; // 查询所有宠物
}

class PetDaoImpl extends Dao implements PetDao {
    // 查询所有宠物
    public List<Pet> findAllPets() throws Exception {
        Connection conn = Dao.getConnection();
        String sql = "select * from pet";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        List<Pet> petList = new ArrayList<>();
        while (rs.next()) {
            Pet pet = new Pet();
			pet.setId(rs.getInt("id"));
			pet.setOwnerId(rs.getInt("owner_id"));
			pet.setStoreId(rs.getInt("store_id"));
			pet.setName(rs.getString("name"));
			pet.setTypeName(rs.getString("type_name"));
			pet.setHealth(rs.getInt("health"));
			pet.setLove(rs.getInt("love"));
			pet.setBirthday(rs.getDate("birthday"));
            petList.add(pet);
        }
        Dao.closeAll(conn, stmt, rs);
        return petList;
    }
}
