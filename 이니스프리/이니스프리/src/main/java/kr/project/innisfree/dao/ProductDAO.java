package kr.project.innisfree.dao;

import java.util.ArrayList;

import kr.project.innisfree.pagination.Criteria;
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

	CategoryVO selectMediumCategoryByMc_pr_code(String mc_pr_code);

	void updateMediumCategory(CategoryVO category);

	ArrayList<ProductVO> selectProductList(Criteria cri);

	int selectProductTotalCount(Criteria cri);

	ProductVO selectProduct(String pr_code);
	
}
