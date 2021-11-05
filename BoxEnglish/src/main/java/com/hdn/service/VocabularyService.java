package com.hdn.service;

import com.hdn.converter.VocabularyConverter;
import com.hdn.dao.VocabularyDao;
import com.hdn.dto.VocabularyDto;
import com.hdn.entity.VocabularyEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Service
public class VocabularyService {
    @Autowired
    private VocabularyDao vocabularyDao;
    @Autowired
    private VocabularyConverter vocabularyConverter;

    public List<VocabularyDto> getAllVocabulary() {
        List<VocabularyEntity> vocabularyEntities = vocabularyDao.findAll();
        return vocabularyConverter.toListDto(vocabularyEntities);
    }
    public VocabularyDto getVocabulary(long id) {
        VocabularyEntity voca = vocabularyDao.getVocabulary(id);
        return vocabularyConverter.toDto(voca);
    }
    public Integer addVocabulary(VocabularyEntity voca) {
        Integer vocaId = vocabularyDao.addVocabulary(voca);
        return vocaId;
    }
}
