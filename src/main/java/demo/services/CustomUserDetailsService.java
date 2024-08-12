package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import demo.dao.UsersDao;
import demo.entity.UsersEntity;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UsersDao usersDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UsersEntity user = usersDao.findByUsername(username)
                                  .stream()
                                  .findFirst()
                                  .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        
        // Chuyển đổi vai trò từ số nguyên thành chuỗi
        List<GrantedAuthority> authorities = new ArrayList<>();
        switch (user.getRole()) {
            case 0:
                authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
                break;
            case 1:
                authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
                break;
            case 2:
                authorities.add(new SimpleGrantedAuthority("ROLE_EMPLOYER"));
                break;
            default:
                authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
                break;
        }
        
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
    }
}
