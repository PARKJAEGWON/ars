package com.groo.kmw.global.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
//시큐리티 콘피그 파일은 거의 정형화 되어있음
public class SecurityConfig {
    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            // CSRF 보호 기능 비활성화
            .csrf(csrf -> csrf.disable())
            
            // HTTP 요청에 대한 인증 설정
            .authorizeHttpRequests(authorize -> authorize
                .anyRequest().permitAll()
            )
            // 폼 로그인 비활성화
            .formLogin(form -> form.disable())
            
            // HTTP Basic 인증 비활성화
            .httpBasic(basic -> basic.disable());
        
        return http.build();
    }

    //비밀번호 암호화시키는 설정
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
