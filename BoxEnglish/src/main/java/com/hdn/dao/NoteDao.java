package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.VocabularyEntity;

import java.util.List;

public interface NoteDao {
	boolean AddNote(CategoryEntity categoryEntity);
	List<CategoryEntity> getAllNote(Long idUser);
	boolean deleteNote(Long id);
	CategoryEntity getNoteById(Long idNote);
	boolean UpdateNote(Long id, CategoryEntity categoryEntity);
	List<VocabularyEntity> getAllNoteDetail(Long idNote);
	boolean AddWordNote(VocabularyEntity wordNote);
}
