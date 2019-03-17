package indi.wh.properties;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties("application.redis")
@Data
@Slf4j
public class RedisProperties implements InitializingBean {

  private String host;
  private int port;

  @Override
  public void afterPropertiesSet() throws Exception {
    log.info("[Config Information]redis.host={}", host);
    log.info("[Config Information]redis.port={}", port);
  }
}
