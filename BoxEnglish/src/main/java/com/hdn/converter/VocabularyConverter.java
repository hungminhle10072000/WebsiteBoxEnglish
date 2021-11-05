package com.hdn.converter;

import com.hdn.dto.VocabularyDto;
import com.hdn.entity.VocabularyEntity;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class VocabularyConverter {
    public VocabularyEntity toEntity(VocabularyDto vocabularyDto) {
        VocabularyEntity vocabularyEntity = new VocabularyEntity();
        vocabularyEntity.setId(vocabularyDto.getId());
        vocabularyEntity.setVocabulary(vocabularyDto.getVocabulary());
        vocabularyEntity.setMean_vocabulary(vocabularyDto.getMean_vocabulary());
        vocabularyEntity.setPartOfSpeech(vocabularyDto.getPartOfSpeech());
        vocabularyEntity.setExplain_vocabulary(vocabularyDto.getExplain_vocabulary());
        vocabularyEntity.setExample_vocabulary(vocabularyDto.getExample_vocabulary());
        vocabularyEntity.setImage_vocabulary(vocabularyDto.getImage_vocabulary());
        vocabularyEntity.setAudio_vocabulary(vocabularyDto.getAudio_vocabulary());
        vocabularyEntity.setIsDelete(vocabularyDto.getIsDelete());
        return vocabularyEntity;
    }

    public VocabularyDto toDto(VocabularyEntity vocabularyEntity) {
        VocabularyDto vocabularyDto = new VocabularyDto();
        vocabularyDto.setId(vocabularyEntity.getId());
        vocabularyDto.setVocabulary(vocabularyEntity.getVocabulary());
        vocabularyDto.setMean_vocabulary(vocabularyEntity.getMean_vocabulary());
        vocabularyDto.setPartOfSpeech(vocabularyEntity.getPartOfSpeech());
        vocabularyDto.setExplain_vocabulary(vocabularyEntity.getExplain_vocabulary());
        vocabularyDto.setExample_vocabulary(vocabularyEntity.getExample_vocabulary());
        vocabularyDto.setImage_vocabulary(vocabularyEntity.getImage_vocabulary());
        vocabularyDto.setAudio_vocabulary(vocabularyEntity.getAudio_vocabulary());
        vocabularyDto.setIsDelete(vocabularyEntity.getIsDelete());

        return vocabularyDto;
    }
    public List<VocabularyDto> toListDto(List<VocabularyEntity> vocabularyEntities) {
        List<VocabularyDto> lstVocabularyDto = new ArrayList<>();
        if (vocabularyEntities != null) {
            for (VocabularyEntity t: vocabularyEntities) {
                VocabularyDto vocabularyDto = toDto(t);
                lstVocabularyDto.add(vocabularyDto);
            }
        }
        return lstVocabularyDto;
    }
}
