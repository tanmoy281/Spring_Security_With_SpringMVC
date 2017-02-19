package login.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig  extends WebSecurityConfigurerAdapter{

	@Autowired
	DataSource dataSource;
	
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
	  /*auth.inMemoryAuthentication().withUser("admin").password("123456").roles("ADMIN");
	  auth.inMemoryAuthentication().withUser("tanmoy").password("123456").roles("DBA");*/
		
		//authentication against database tables
		auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery(
				"select username,password, enabled from users where username=?")
		.authoritiesByUsernameQuery(
				"select username, role from user_roles where username=?");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().
		antMatchers("/secure/**").access("hasRole('ROLE_ADMIN')").
		antMatchers("/registerme").permitAll().
		antMatchers("/register").permitAll().
		antMatchers("/registered").permitAll().
		and().formLogin().  //login configuration
                loginPage("/customLogin.jsp").
                loginProcessingUrl("/appLogin").
                usernameParameter("app_username").
                passwordParameter("app_password").
                defaultSuccessUrl("/secure/home").	
		and().logout().    //logout configuration
		logoutUrl("/appLogout"). 
		logoutSuccessUrl("/customLogin.jsp?logout");
		
	}
}
