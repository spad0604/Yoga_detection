package com.service.impl;

import com.dto.request.ChangeInformationRequest;
import com.dto.request.ChangePasswordRequest;
import com.dto.response.ApiResponse;
import com.entity.User;
import com.exception.InvalidPasswordException;
import com.exception.UserNotFoundException;
import com.repository.UserRepository;
import com.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


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

    @Override
    public ApiResponse <Map< String, String >> getInformation(String id) {
        Map< String, String > map = new HashMap<>();
        ApiResponse apiResponse = new ApiResponse();
        User user = userRepository.findById(id.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        map.put("email", user.getEmail());
        map.put("id",  user.getId());
        map.put("firstName", user.getFirstName());
        map.put("lastName", user.getLastName());
        map.put("dob", user.getBirthDate().toString());
        map.put("registerDate", user.getRegisterDate().toString());
        apiResponse.setData(map);
        return apiResponse;
    }

    @Override
    public ApiResponse<String> changeInformation(ChangeInformationRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        if (request.getDob() != null) {
            user.setBirthDate(request.getDob());
        }
        if (request.getFirstName() != null) {
            user.setFirstName(request.getFirstName());
        }
        if (request.getLastName() != null) {
            user.setLastName(request.getLastName());
        }
        userRepository.save(user);
        return new ApiResponse<>();
    }

    public ApiResponse<String> deleteUser(String id) {
        User user = userRepository.findById(id.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        userRepository.delete(user);
        return new ApiResponse<>();
    }
}
