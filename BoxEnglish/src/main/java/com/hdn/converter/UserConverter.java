package com.hdn.converter;

import com.hdn.dto.UserDto;
import com.hdn.entity.UserEntity;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserConverter {
    public UserEntity toEntity(UserDto userDto) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userDto.getId());
        userEntity.setFullname(userDto.getFullname());
        userEntity.setUsername(userDto.getUsername());
        userEntity.setPassword(userDto.getPassword());
        userEntity.setAvatar(userDto.getAvatar());
        userEntity.setScore(userDto.getScore());
        userEntity.setRole(userDto.getRole());
        userEntity.setIsDelete(userDto.getIsDelete());
        return userEntity;
    }

    public UserDto toDto(UserEntity userEntity) {
        UserDto userDto = new UserDto();
        userDto.setId(userEntity.getId());
        userDto.setFullname(userEntity.getFullname());
        userDto.setUsername(userEntity.getUsername());
        userDto.setPassword(userEntity.getPassword());
        userDto.setAvatar(userEntity.getAvatar());
        userDto.setScore(userEntity.getScore());
        userDto.setRole(userEntity.getRole());
        userDto.setIsDelete(userEntity.getIsDelete());
        return userDto;
    }
    public List<UserDto> toListDto(List<UserEntity> userEntities) {
        List<UserDto> lstUserDto = new ArrayList();
        if (userEntities != null) {
            for (UserEntity t: userEntities) {
                UserDto userDto = toDto(t);
                lstUserDto.add(userDto);
            }
        }
        return lstUserDto;
    }
}
