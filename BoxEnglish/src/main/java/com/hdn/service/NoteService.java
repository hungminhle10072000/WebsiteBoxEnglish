package com.hdn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hdn.dao.NoteDao;
import com.hdn.daoimp.NoteImp;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.VocabularyEntity;

@Service
public class NoteService implements NoteDao{
	
	@Autowired
	NoteImp noteImp;

	@Override
	public boolean AddNote(CategoryEntity categoryEntity) {
		// TODO Auto-generated method stub
		return noteImp.AddNote(categoryEntity);
	}

	@Override
	public List<CategoryEntity> getAllNote(Long idUser) {
		// TODO Auto-generated method stub
		return noteImp.getAllNote(idUser);
	}

	@Override
	public boolean deleteNote(Long id) {
		return noteImp.deleteNote(id);
	}

	@Override
	public CategoryEntity getNoteById(Long idNote) {
		return noteImp.getNoteById(idNote);
	}

	@Override
	public boolean UpdateNote(Long id, CategoryEntity categoryEntity) {
		return noteImp.UpdateNote(id, categoryEntity);
	}

	@Override
	public List<VocabularyEntity> getAllNoteDetail(Long idUser) {
		return noteImp.getAllNoteDetail(idUser);
	}

	@Override
	public VocabularyEntity AddWordNote(VocabularyEntity wordNote) {
		return noteImp.AddWordNote(wordNote);
	}

	@Override
	public boolean deleteWordNote(Long idWord) {
		return noteImp.deleteWordNote(idWord);
	}

	@Override
	public boolean UpdateWordNote(Long idWord, String vocabulary, String mean_vocabulary, MultipartFile file_audio) {
		return noteImp.UpdateWordNote(idWord, vocabulary, mean_vocabulary, file_audio);
	}

	@Override
	public VocabularyEntity getWordNoteById(Long idWord) {
		return noteImp.getWordNoteById(idWord);
	}

}
