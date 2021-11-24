package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.VocabularyEntity;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface NoteDao {
	boolean AddNote(CategoryEntity categoryEntity);
	List<CategoryEntity> getAllNote(Long idUser);
	boolean deleteNote(Long id);
	CategoryEntity getNoteById(Long idNote);
	boolean UpdateNote(Long id, CategoryEntity categoryEntity);
	List<VocabularyEntity> getAllNoteDetail(Long idNote);
	VocabularyEntity AddWordNote(VocabularyEntity wordNote);
	boolean deleteWordNote(Long idWord);
	boolean UpdateWordNote(Long idWord, String vocabulary, String mean_vocabulary, MultipartFile file_audio);
	VocabularyEntity getWordNoteById(Long idWord);
}
