package com.hdn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.NoteDao;
import com.hdn.daoimp.NoteImp;
import com.hdn.entity.CategoryEntity;

@Service
public class NoteService implements NoteDao{
	
	@Autowired
	NoteImp noteImp;

	public boolean AddNote(CategoryEntity categoryEntity) {
		// TODO Auto-generated method stub
		return noteImp.AddNote(categoryEntity);
	}

}
