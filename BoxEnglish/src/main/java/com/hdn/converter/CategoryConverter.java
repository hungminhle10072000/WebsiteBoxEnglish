//package com.hdn.converter;
//
//import com.hdn.dto.CategoryDto;
//import com.hdn.entity.CategoryEntity;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.stereotype.Component;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@Component
//public class CategoryConverter {
//
//
//    public CategoryEntity toEntity(CategoryDto categoryDto) {
//        CategoryEntity categoryEntity = new CategoryEntity();
//        categoryEntity.setId(categoryDto.getId());
//        categoryEntity.setTitle(categoryDto.getTitle());
//        categoryEntity.setImage(categoryDto.getImage());
//        categoryEntity.setDescription(categoryDto.getDescription());
//		/* categoryEntity.setDelete(categoryDto.isDelete()); */
//        return categoryEntity;
//    }
//
//    public CategoryDto toDto(CategoryEntity categoryEntity) {
//        CategoryDto categoryDto = new CategoryDto();
//        categoryDto.setId(categoryEntity.getId());
//        categoryDto.setTitle(categoryEntity.getTitle());
//        categoryDto.setDescription(categoryEntity.getDescription());
//        categoryDto.setImage(categoryEntity.getImage());
//		/* categoryDto.setDelete(categoryEntity.isDelete()); */
//        return categoryDto;
//    }
//    public List<CategoryDto> toListDto(List<CategoryEntity> categoryEntities) {
//        List<CategoryDto> lstCategoryDto = new ArrayList<>();
//        if (categoryEntities != null) {
//            for (CategoryEntity t: categoryEntities) {
//                CategoryDto categoryDto = toDto(t);
//                lstCategoryDto.add(categoryDto);
//            }
//        }
//        return lstCategoryDto;
//    }
//}
