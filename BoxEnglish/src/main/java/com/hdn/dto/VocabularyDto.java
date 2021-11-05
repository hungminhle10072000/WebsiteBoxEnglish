package com.hdn.dto;



public class VocabularyDto {
    private long id;
    private String vocabulary;
    private String mean_vocabulary;
    private String partOfSpeech;
    private String explain_vocabulary;
    private String example_vocabulary;
    private String image_vocabulary;
    private String audio_vocabulary;
    private int isDelete;
    private CategoryDto categoryDto;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getVocabulary() {
        return vocabulary;
    }

    public void setVocabulary(String vocabulary) {
        this.vocabulary = vocabulary;
    }

    public String getMean_vocabulary() {
        return mean_vocabulary;
    }

    public void setMean_vocabulary(String mean_vocabulary) {
        this.mean_vocabulary = mean_vocabulary;
    }

    public String getPartOfSpeech() {
        return partOfSpeech;
    }

    public void setPartOfSpeech(String partOfSpeech) {
        this.partOfSpeech = partOfSpeech;
    }

    public String getExplain_vocabulary() {
        return explain_vocabulary;
    }

    public void setExplain_vocabulary(String explain_vocabulary) {
        this.explain_vocabulary = explain_vocabulary;
    }

    public String getExample_vocabulary() {
        return example_vocabulary;
    }

    public void setExample_vocabulary(String example_vocabulary) {
        this.example_vocabulary = example_vocabulary;
    }

    public String getImage_vocabulary() {
        return image_vocabulary;
    }

    public void setImage_vocabulary(String image_vocabulary) {
        this.image_vocabulary = image_vocabulary;
    }

    public String getAudio_vocabulary() {
        return audio_vocabulary;
    }

    public void setAudio_vocabulary(String audio_vocabulary) {
        this.audio_vocabulary = audio_vocabulary;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }

    public CategoryDto getCategoryDto() {
        return categoryDto;
    }

    public void setCategoryDto(CategoryDto categoryDto) {
        this.categoryDto = categoryDto;
    }
}
