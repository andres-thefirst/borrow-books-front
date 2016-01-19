package com.andres.thefirst.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.andres.thefirst.books.entity.User;
import com.andres.thefirst.books.service.IUserBo;
import com.andres.thefirst.security.Role;
import com.andres.thefirst.security.UserAccess;

@Service("userService")
public class UserService implements UserDetailsService {
 
    @Autowired
    private IUserBo userBo;
	
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User userEntity = userBo.findByUser(username);
        
        if(userEntity==null)
        	return null;
        
        UserAccess userA = new UserAccess();
        userA.setUsername(userEntity.getUser());
        userA.setPassword(userEntity.getPassword());
        Role r = new Role();
        r.setName("ROLE_USER");
        List<Role> roles = new ArrayList<Role>();
        roles.add(r);
        userA.setAuthorities(roles);
        
        return userA;
    }


 

}