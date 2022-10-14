package kr.project.innisfree.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.project.innisfree.pagination.Criteria;
import kr.project.innisfree.vo.CategoryDTO;
import kr.project.innisfree.vo.CategoryVO;
import kr.project.innisfree.vo.ProductVO;

public interface ProductService {

	int insertCategory(CategoryVO category);

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<CategoryVO> getCategoryList(CategoryDTO cdto);

	void insertProduct(ProductVO product, MultipartFile file);

	ArrayList<ProductVO> selectProductList(Criteria cri);

	int getProductTotalCount(Criteria cri);

}
