package login.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;


@Configuration
@Import({SecurityConfig.class})
@PropertySource("/WEB-INF/jdbc.properties")
public class RootConfig {
	
	@Value("${jdbc.url}")
	private String url;
	@Value("${jdbc.username}")
	private String userid;
	@Value("${jdbc.password}")
	private String passwod;
	
	@Bean(name = "dataSource")
	public DriverManagerDataSource dataSource() {
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		driverManagerDataSource.setUrl(url);
		driverManagerDataSource.setUsername(userid);
		driverManagerDataSource.setPassword(passwod);
		return driverManagerDataSource;
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate(DataSource d){
		return new JdbcTemplate(d);
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
		return new PropertySourcesPlaceholderConfigurer();
	}
}