package com.hdn.dao;

import com.hdn.entity.CommentEntity;

import java.util.List;

public interface CommentDao {
    Long addComment(CommentEntity commentEntity);
    List<CommentEntity> getCommentByCategoryId(Long id);
    CommentEntity getById(Long id);
}
