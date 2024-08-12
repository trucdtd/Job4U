package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import demo.dao.UsersDao;
import demo.entity.UsersEntity;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UsersDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UsersEntity user = userDao.findByUsername(username).stream()
            .findFirst()
            .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        return org.springframework.security.core.userdetails.User.builder()
            .username(user.getUsername())
            .password(user.getPassword())
            .roles(user.getRole() == 0 ? "ROLE_ADMIN" : user.getRole() == 2 ? "ROLE_EMPLOYER" : "ROLE_USER")
            .build();
    }

}
