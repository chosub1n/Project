package kr.project.innisfree.dao;

import java.util.ArrayList;

import kr.project.innisfree.vo.CategoryVO;
import kr.project.innisfree.vo.ProductVO;

public interface ProductDAO {

	void insertCategory(CategoryVO category);

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<CategoryVO> selectLargeCategory();

	ArrayList<CategoryVO> selectMediumCategory(int code);

	void insertLargeCategory(CategoryVO category);

	void insertMediumCategory(CategoryVO category);

	void insertProduct(ProductVO product);

	CategoryVO selectCategoryByMc_pr_code(String mc_pr_code);

	void updateCategory(CategoryVO category);

	
}
