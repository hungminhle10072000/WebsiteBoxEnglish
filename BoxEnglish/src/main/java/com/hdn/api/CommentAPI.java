package com.hdn.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdn.cons.Cons;
import com.hdn.converter.UserConverter;
import com.hdn.daoimp.CommentDaoImpl;
import com.hdn.dto.CommentDto;
import com.hdn.dto.ReviewDto;
import com.hdn.dto.UserDto;
import com.hdn.entity.UserEntity;
import com.hdn.service.CommentService;
import com.hdn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.Entity;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.Date;

@RestController
@RequestMapping("/api/comment")
public class CommentAPI {
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserConverter userConverter;
    @PostMapping("/insert")
    public String insertComment(@RequestBody CommentDto commentDto) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        UserDto userCurrent = new UserDto();
        userCurrent.setId(Cons.USER_ID);
        commentDto.setUser(userCurrent);
        Date date= new Date();
        commentDto.setCreateDate(date);
        Long id = commentService.addComment(commentDto);
        UserEntity user = userService.GetUser(userCurrent.getId());
        UserDto userDto = userConverter.toDto(user);
        return mapper.writeValueAsString(userDto);
    }
}
