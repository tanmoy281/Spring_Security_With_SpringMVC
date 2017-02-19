package login.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import com.tanmoy.config.DispatcherServletConfig;

@Configuration
@ComponentScan
@Import({DispatcherServletConfig.class})
public class WebConfig {

}
