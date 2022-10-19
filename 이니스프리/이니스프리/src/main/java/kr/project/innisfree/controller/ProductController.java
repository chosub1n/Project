package kr.project.innisfree.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.project.innisfree.pagination.Criteria;
import kr.project.innisfree.pagination.PageMaker;
import kr.project.innisfree.service.ProductService;
import kr.project.innisfree.vo.MemberVO;
import kr.project.innisfree.vo.CategoryVO;
import kr.project.innisfree.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/product/select", method = RequestMethod.GET)
	public ModelAndView productSelect(ModelAndView mv, String pr_code) {
		ProductVO product = productService.selectProduct(pr_code);
		mv.addObject("p", product);
		mv.addObject("title", product.getPr_title());
		mv.setViewName("/product/select");
		return mv;
	}
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public ModelAndView productList(ModelAndView mv, String mc_name) {
		mv.addObject("pr_mc_name", mc_name);
		mv.setViewName("/product/list");
		return mv;
	}
	@RequestMapping(value="/category/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> categoryList() {
		HashMap<Object,Object> map = new HashMap<Object, Object>();
		ArrayList<CategoryVO> list = productService.getCategoryList();
		map.put("list", list);
		return map;
	}
	@RequestMapping(value="/ajax/product/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> ajaxProductList(@RequestBody Criteria cri) {
		HashMap<Object,Object> map = new HashMap<Object, Object>();
		ArrayList<ProductVO> list = productService.selectProductList(cri);
		int totalCount = productService.getProductTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		map.put("pm", pm);
		map.put("list", list);
		return map;
	}
	
	//주문하기(장바구니 안 거치고 바로결제)
	@RequestMapping(value = "/product/order/{pr_code}", method = RequestMethod.GET)
	public ModelAndView productOrderGet(ModelAndView mv, @PathVariable("pr_code")String pr_code,
			Integer pr_count, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//제품 정보
		ProductVO product = productService.selectProduct(pr_code);
		
		mv.addObject("product",product);
		mv.addObject("pr_count", pr_count);
		mv.addObject("title", "결제 | Innsfree");
		mv.setViewName("/product/order");
		return mv;
	}

}
