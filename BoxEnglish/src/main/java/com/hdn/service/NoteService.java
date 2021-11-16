package com.hdn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.NoteDao;
import com.hdn.daoimp.NoteImp;
import com.hdn.entity.CategoryEntity;

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

}
