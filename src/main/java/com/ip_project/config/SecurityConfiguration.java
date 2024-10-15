package com.ip_project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import com.ip_project.service.CustomOAuth2UserService;

@Configuration
public class SecurityConfiguration {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeHttpRequests()
                .antMatchers("/", "/member/**").permitAll()
                .antMatchers("/board/**").authenticated()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/member/login")
                .defaultSuccessUrl("/board/list")
                .and()
                .logout()
                .logoutUrl("/member/logout")
                .logoutSuccessUrl("/")
                .and()
                .oauth2Login()
                .loginPage("/member/login")
                .defaultSuccessUrl("/board/list")
                .userInfoEndpoint()
                .userService(customOAuth2UserService);

        http.userDetailsService(userDetailsService);

        return http.build();
    }
}