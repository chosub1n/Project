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
		if(category == null || category.getLc_name() == null || category.getLc_name().length() == 0 ||
		    category.getMc_name() == null || category.getMc_name().length() == 0 ||
		    category.getSc_name() == null || category.getSc_name().length() == 0)
				return -2;
		try {
			productDao.insertCategory(category);
		}catch(Exception e) {
			return -1;
		}
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
		if(cdto.getTb_name().equals("midium_category"))
			return productDao.selectMidiumCategory(cdto.getCode());
		return productDao.selectSmallCategory(cdto.getCode());
	}
	
}
