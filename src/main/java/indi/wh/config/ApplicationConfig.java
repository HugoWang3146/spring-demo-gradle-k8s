package indi.wh.config;


import indi.wh.properties.RedisProperties;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;

@Configuration
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class ApplicationConfig {

  RedisProperties redisProperties;

  @Bean
  public LettuceConnectionFactory redisConnectionFactory() {
    return new LettuceConnectionFactory(
        new RedisStandaloneConfiguration(redisProperties.getHost(), redisProperties.getPort()));
  }
}
