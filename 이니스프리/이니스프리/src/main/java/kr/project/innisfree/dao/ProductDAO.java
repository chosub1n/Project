package kr.project.innisfree.dao;

import java.util.ArrayList;

import kr.project.innisfree.vo.CategoryVO;

public interface ProductDAO {

	void insertCategory(CategoryVO category);

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<CategoryVO> selectLargeCategory();

	ArrayList<CategoryVO> selectMidiumCategory(int code);

	ArrayList<CategoryVO> selectSmallCategory(int code);
	
}
