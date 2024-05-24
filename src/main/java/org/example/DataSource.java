package org.example;

import com.zaxxer.hikari.*;
import org.flywaydb.core.*;

import java.sql.*;

public class DataSource {
    private  static DataSource INSTANCE;
    private static final String DB_URL ="jdbc:postgresql://localhost:5432/mega_soft";
    private static final String DB_USERNAME = "postgres";
    private static final String DB_PASSWORD = "postgres";

    private static HikariConfig config = new HikariConfig();
    private static HikariDataSource ds;

    private DataSource(){
        config.setJdbcUrl(DB_URL);
        config.setUsername(DB_USERNAME);
        config.setPassword(DB_PASSWORD);
        ds = new HikariDataSource(config);

        Flyway flyway = Flyway.configure()
                .dataSource(ds)
                .locations("db/migration")
                .load();
        flyway.migrate();
    }

    public static DataSource getInstance(){
        if (INSTANCE == null){
            INSTANCE = new DataSource();
        }
        return INSTANCE;
    }

    public Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}
