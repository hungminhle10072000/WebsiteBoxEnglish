package com.hdn.service;

import com.hdn.converter.CommentConverter;
import com.hdn.dao.CommentDao;
import com.hdn.daoimp.CommentDaoImpl;
import com.hdn.dto.CommentDto;
import com.hdn.entity.CommentEntity;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentDao commentDao;
    
    @Autowired
    private CommentDaoImpl commentDaoImpl;
    
    @Autowired
    private CommentConverter commentConverter;
    public Long addComment(CommentDto commentDto) {
        CommentEntity commentEntity = commentConverter.toEntity(commentDto);
        return commentDao.addComment(commentEntity);
    }
    public List<CommentDto> getCommentByCategoryId(Long id) {
        List<CommentEntity> commentEntities = commentDao.getCommentByCategoryId(id);
        List<CommentDto> commentDtos = commentConverter.toListDto(commentEntities);
        return commentDtos;
    }
    public List<CommentEntity> getAllComment() {
    	return commentDaoImpl.getAllComment();
    }
    
    public boolean deleteComment(Long idComment) {
    	return commentDaoImpl.deleteComment(idComment);
    }
}
