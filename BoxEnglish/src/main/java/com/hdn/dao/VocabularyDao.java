package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.VocabularyEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


public interface VocabularyDao {
	
    VocabularyEntity getVocabulary(Long id);
    List<VocabularyEntity> findAll();
    Integer addVocabulary(VocabularyEntity vocabularyEntity);
    boolean addVocaCourse(VocabularyEntity vocabularyEntity);
    List<VocabularyEntity> findVocaCourse(Long idCourse);
    boolean deleteVocaCouse(Long idVoca);
    boolean updateVocaCourse(Long idVoca, VocabularyEntity vocabularyEntity);
}
