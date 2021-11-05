package com.hdn.controller;

import com.hdn.dto.CategoryDto;
import com.hdn.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/api/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/getOne/{id}")
    public ModelAndView getCategory(@PathVariable("id") Long id) {
        CategoryDto category = categoryService.getCategory(id);
        ModelAndView mav = new ModelAndView("practice-voca");
        mav.addObject("category",category);
        return mav;
    }

  /*  @GetMapping("/getAll")
    public List<CategoryDto> getAllCategories() {
        List<CategoryDto> categoryDtos = categoryService.getAllCategories();
        return categoryDtos;
    }
    @PostMapping("/add")
    public CategoryDto addCategory(CategoryDto categoryDto) {
        CategoryDto category = categoryService.addCategory(categoryDto);
        return category;
    }*/
}
