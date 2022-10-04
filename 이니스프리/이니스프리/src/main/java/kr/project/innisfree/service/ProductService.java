package kr.project.innisfree.service;

import java.util.ArrayList;

import kr.project.innisfree.vo.CategoryDTO;
import kr.project.innisfree.vo.CategoryVO;

public interface ProductService {

	int insertCategory(CategoryVO category);

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<CategoryVO> getCategoryList(CategoryDTO cdto);

}
