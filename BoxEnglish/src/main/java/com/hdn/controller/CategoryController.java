package com.hdn.controller;

import com.hdn.dto.CategoryDto;
import com.hdn.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/api/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/getAll")
    public List<CategoryDto> getAllCategories() {
        List<CategoryDto> categoryDtos = categoryService.getAllCategories();
        return categoryDtos;
    }
    @PostMapping("/add")
    public CategoryDto addCategory(CategoryDto categoryDto) {
        CategoryDto category = categoryService.addCategory(categoryDto);
        return category;
    }
}
