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
		if(category == null || category.getMc_name() == null || category.getMc_name().length() == 0)
				return -2;
		
		String prefix = product.getPr_ca_name();//COM001
		CategoryVO category = productDao.selectCategoryByCa_code(prefix.substring(0,3));
		try {
			product.setPr_ca_name(category.getCa_name());
			String dir = product.getPr_ca_name();//COM

			String str = UploadFileUtils.uploadFile(productThumbnailUploadPath,File.separator + dir, prefix, file.getOriginalFilename(), file.getBytes());
			product.setPr_thumb("/" +dir+ str);
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
		
		//선택된 중분류가 없고, 선택된 대분류가 있다면 => 현재 중분류를 등록
		if(category.getLc_code() != 0)
			productDao.insertMidiumCategory(category);
		else
			productDao.insertLargeCategory(category);
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
