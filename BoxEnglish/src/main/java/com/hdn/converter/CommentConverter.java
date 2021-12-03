package com.hdn.converter;

import com.hdn.daoimp.CategoryImp;
import com.hdn.daoimp.CommentDaoImpl;
import com.hdn.daoimp.UserImp;
import com.hdn.daoimp.VocabularyImpl;
import com.hdn.dto.CategoryDto;
import com.hdn.dto.CommentDto;
import com.hdn.dto.UserDto;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.CommentEntity;
import com.hdn.entity.UserEntity;
import com.hdn.entity.VocabularyEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CommentConverter {
    @Autowired
    private UserImp userImp;
    @Autowired
    private UserConverter userConverter;
    @Autowired
    private CategoryImp categoryImp;
    @Autowired
    private CategoryConverter categoryConverter;
    @Autowired
    private CommentDaoImpl commentDao;

    public CommentEntity toEntity(CommentDto commentDto) {
        CommentEntity commentEntity = new CommentEntity();
        if (commentDto.getId() !=null) {
            commentEntity.setId(commentDto.getId());
        }

        commentEntity.setContent(commentDto.getContent());
        commentEntity.setCreateDate(commentDto.getCreateDate());
        commentEntity.setStatus(commentDto.getStatus());
        if (commentDto.getParent()!=null && commentDto.getParent().getId() != 0) {
            CommentEntity parent = commentDao.getById(commentDto.getParent().getId());
            commentEntity.setParent(parent);
        } else {
            commentEntity.setParent(null);
        }


        CategoryEntity cate = categoryImp.getCategory(commentDto.getCategory().getId());
        commentEntity.setCategoryEntity(cate);
        if (commentDto.getUser()!=null) {
            UserEntity user = userImp.GetUser(commentDto.getUser().getId());
            commentEntity.setUser(user);
        } else {
            commentEntity.setUser(null);
        }
        return commentEntity;
    }

    public CommentDto toDto(CommentEntity commentEntity) {
        CommentDto commentDto = new CommentDto();
        commentDto.setId(commentEntity.getId());

        commentDto.setContent(commentEntity.getContent());
        commentDto.setCreateDate(commentEntity.getCreateDate());
        commentDto.setStatus(commentEntity.getStatus());
        if (commentEntity.getParent()!=null &&commentEntity.getParent().getId() != 0 ) {
            CommentEntity parent = commentEntity.getParent();
            CommentDto com = toDto(parent);
            commentDto.setParent(com);

        } else {
            commentDto.setParent(null);
        }

        CategoryEntity cate = commentEntity.getCategoryEntity();
        CategoryDto categoryDto = categoryConverter.toDto(cate);
        commentDto.setCategory(categoryDto);
        if (commentEntity.getUser()!=null) {
            UserEntity user = commentEntity.getUser();
            commentDto.setUser(userConverter.toDto(user));
        } else {
            commentDto.setUser(null);
        }
        return commentDto;
    }
    public List<CommentDto> toListDto(List<CommentEntity> commentEntities) {
        List<CommentDto> lstCommentDto = new ArrayList();
        if (commentEntities != null) {
            for (CommentEntity t: commentEntities) {
                CommentDto commentDto = toDto(t);
                lstCommentDto.add(commentDto);
            }
        }
        return lstCommentDto;
    }
}
