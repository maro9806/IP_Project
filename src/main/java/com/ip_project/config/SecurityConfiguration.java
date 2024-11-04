package com.ip_project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import com.ip_project.service.CustomOAuth2UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {


    private final UserDetailsService userDetailsService;
    private final CustomOAuth2UserService customOAuth2UserService;  // 필드 정의


    @Autowired  // 생성자가 하나일 경우 @Autowired 생략 가능
    public SecurityConfiguration(UserDetailsService userDetailsService, CustomOAuth2UserService customOAuth2UserService) {
        this.userDetailsService = userDetailsService;
        this.customOAuth2UserService = customOAuth2UserService;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/**").permitAll()  // 로그인 및 회원가입 페이지는 허용
                )
                .formLogin(form -> form
                        .loginPage("/member/login")
                        .loginProcessingUrl("/member/login-process")
                        .defaultSuccessUrl("/", true)  // 로그인 성공 시 리다이렉트 경로
                        .failureUrl("/member/login?error=true")
                        .usernameParameter("username")
                        .passwordParameter("password")
                )
                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/member/login")
                        .defaultSuccessUrl("/")
                        .userInfoEndpoint(endpoint -> endpoint
                                .userService(customOAuth2UserService)
                        )
                )
                .logout(logout -> logout
                        .logoutUrl("/member/logout")
                        .logoutSuccessUrl("/")
                        .invalidateHttpSession(true)
                        .clearAuthentication(true)
                        .deleteCookies("JSESSIONID")
                );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}