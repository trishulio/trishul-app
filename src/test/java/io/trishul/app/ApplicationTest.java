package io.trishul.app;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import static org.junit.jupiter.api.Assertions.assertFalse;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("test")
class ApplicationTests {
  private static Logger log = LoggerFactory.getLogger(ApplicationTests.class);

  // @MockBean
  // private TenantService tenantService;

  @Test
  void contextLoads() {}

  @Test
  public void testAutoCommitIsSetToFalse(@Autowired DataSource ds) throws SQLException {
    try (Connection conn = ds.getConnection()) {
      log.debug("Database Product Name: {}", conn.getMetaData().getDatabaseProductName());
      log.debug("Database Username: {}", conn.getMetaData().getUserName());
      assertFalse(conn.getAutoCommit());
    }
  }
}
