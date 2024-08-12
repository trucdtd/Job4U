package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import demo.dao.UsersDao;
import demo.entity.UsersEntity;

import java.util.Collections;
import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UsersDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UsersEntity user = userDao.findByUsername(username).stream()
            .findFirst()
            .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        // Convert role to authority
        String role = switch (user.getRole()) {
            case 0 -> "ROLE_ADMIN";
            case 2 -> "ROLE_EMPLOYER";
            default -> "ROLE_USER";
        };

        return new org.springframework.security.core.userdetails.User(
            user.getUsername(),
            user.getPassword(),
            Collections.singletonList(new SimpleGrantedAuthority(role))
        );
    }
}
