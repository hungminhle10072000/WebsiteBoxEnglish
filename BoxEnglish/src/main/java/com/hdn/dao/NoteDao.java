package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import java.util.List;

public interface NoteDao {
	boolean AddNote(CategoryEntity categoryEntity);
	List<CategoryEntity> getAllNote(Long idUser);
	boolean deleteNote(Long id);
}
