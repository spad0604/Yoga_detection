package com.yogadetection.service.impl;

import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.entity.User;
import com.yogadetection.exception.InvalidPasswordException;
import com.yogadetection.exception.UserNotFoundException;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Override
    public void changePassword(ChangePasswordRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());

        if (passwordEncoder.matches(request.getOldPassword(), user.getPassword())) {
            user.setPassword(passwordEncoder.encode(request.getNewPassword()));
            userRepository.save(user);
        }
        else throw new InvalidPasswordException();
    }
}
