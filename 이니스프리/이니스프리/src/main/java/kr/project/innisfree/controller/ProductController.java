package kr.project.innisfree.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.project.innisfree.service.ProductService;
import kr.project.innisfree.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;

	@RequestMapping(value = "/product/select", method = RequestMethod.GET)
	public ModelAndView productSelect(ModelAndView mv, String pr_code) {
		ProductVO product = productService.selectProduct(pr_code);
		mv.addObject("p", product);
		mv.addObject("title", "이니스프리 | Innisfree - 제품 상세");
		mv.setViewName("/product/select");
		return mv;
	}

}
