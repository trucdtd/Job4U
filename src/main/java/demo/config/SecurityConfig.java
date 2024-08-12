package demo.config;

import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import demo.services.CustomUserDetailsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Bean
    public AuthenticationSuccessHandler successHandler() {
        return new SimpleUrlAuthenticationSuccessHandler() {
            @Override
            public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                                Authentication authentication) throws IOException, ServletException {
                User user = (User) authentication.getPrincipal();
                String role = user.getAuthorities().iterator().next().getAuthority();
                String redirectUrl;

                switch (role) {
                    case "ROLE_ADMIN":
                        redirectUrl = "/admin";
                        break;
                    case "ROLE_EMPLOYER":
                        redirectUrl = "/job4u/employers";
                        break;
                    case "ROLE_USER":
                        redirectUrl = "/job4u";
                        break;
                    default:
                        redirectUrl = "/default";
                }

                getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            }
        };
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        HttpSecurity userDetailsService2 = http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/admin/*").hasRole("ADMIN")
                        .requestMatchers("/job4u/employers/**").hasRole("EMPLOYER")
                        .anyRequest().permitAll())
                .formLogin((form) -> form
                        .loginPage("/Login")
                        .successHandler(successHandler())
                        .permitAll())
                .logout((logout) -> logout
                        .logoutUrl("/Logout")
                        .logoutSuccessUrl("/job4u")
                        .permitAll())
                .exceptionHandling(handling -> handling
                        .accessDeniedPage("/403"))
                .userDetailsService(userDetailsService);
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}