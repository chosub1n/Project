package kr.project.innisfree.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.innisfree.dao.ProductDAO;
import kr.project.innisfree.vo.CategoryDTO;
import kr.project.innisfree.vo.CategoryVO;

@Service
public class ProductServiceImp implements ProductService{
	
	@Autowired
	ProductDAO productDao;


	@Override
	public int insertCategory(CategoryVO category) {
		if(category == null )
				return -2;
		if((category.getMc_pr_code() == null || category.getMc_pr_code().length() != 4) 
				&& (category.getLc_name()==null || category.getLc_name().length() == 0))
			return 1;
		
		//선택된 대분류가 없다면 대분류를 등록
		if(category.getLc_code() ==0)
			productDao.insertLargeCategory(category);
		else
			productDao.insertMediumCategory(category);
		return 0;
		
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return productDao.selectCategoryList();
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList(CategoryDTO cdto) {
		if(cdto == null)
			return null;
		if(cdto.getTb_name().equals("large_category"))
			return productDao.selectLargeCategory();
		return productDao.selectMediumCategory(cdto.getCode());
	}

	
}
