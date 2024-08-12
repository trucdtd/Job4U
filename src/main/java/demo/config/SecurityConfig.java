package demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import demo.services.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Autowired
	private CustomUserDetailsService userDetailsService;

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.csrf().disable() // Tạm thời vô hiệu hóa CSRF để kiểm tra
				.authorizeHttpRequests((requests) -> requests.requestMatchers("/admin/**").hasRole("ADMIN")
						.requestMatchers("/job4u/employers/**").hasRole("EMPLOYER").anyRequest().permitAll())
				.formLogin((form) -> form.loginPage("/Login").defaultSuccessUrl("/default", true).permitAll())
				.logout((logout) -> logout.logoutUrl("/Logout").logoutSuccessUrl("/job4u").permitAll())
				.exceptionHandling().accessDeniedPage("/403").and().userDetailsService(userDetailsService); // Đăng ký
																											// UserDetailsService
		return http.build();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder(); // Sử dụng BCrypt để mã hóa mật khẩu
	}
}
