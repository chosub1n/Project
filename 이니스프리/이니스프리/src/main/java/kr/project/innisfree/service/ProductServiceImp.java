package kr.project.innisfree.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.project.innisfree.dao.ProductDAO;
import kr.project.innisfree.utils.UploadFileUtils;
import kr.project.innisfree.vo.CategoryDTO;
import kr.project.innisfree.vo.CategoryVO;
import kr.project.innisfree.vo.ProductVO;

@Service
public class ProductServiceImp implements ProductService{
	
	@Autowired
	ProductDAO productDao;

	String productThumbnailUploadPath = "D:\\git\\innisfreeproduct";

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

	@Override
	public void insertProduct(ProductVO product, MultipartFile file) {
		if(product == null || file == null || file.getOriginalFilename().length() == 0)
			return;

		String prefix = product.getPr_code().substring(0,4);//SKIN
		CategoryVO category = productDao.selectMediumCategoryByMc_pr_code(prefix);
		try {
			product.setPr_mc_name(category.getMc_name());
			String dir = prefix;//SKIN

			String str = UploadFileUtils.uploadFile(productThumbnailUploadPath,File.separator + dir, prefix, file.getOriginalFilename(), file.getBytes());
			product.setPr_thumb("/" +dir+ str);
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		productDao.insertProduct(product);
		productDao.updateMediumCategory(category);
	}

}
