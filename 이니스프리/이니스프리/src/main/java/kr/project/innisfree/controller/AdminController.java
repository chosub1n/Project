package kr.project.innisfree.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.project.innisfree.pagination.Criteria;
import kr.project.innisfree.pagination.PageMaker;
import kr.project.innisfree.service.MessageService;
import kr.project.innisfree.service.NoticeService;
import kr.project.innisfree.service.ProductService;
import kr.project.innisfree.vo.CategoryDTO;
import kr.project.innisfree.vo.CategoryVO;
import kr.project.innisfree.vo.MemberVO;
import kr.project.innisfree.vo.NoticeVO;
import kr.project.innisfree.vo.ProductVO;


@Controller
public class AdminController {
	
	@Autowired
	MessageService messageService;

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ProductService productService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.addObject("title", "이니스프리 | Innisfree - 관리자");
		mv.setViewName("/admin/home");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/list", method = RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(2);
		ArrayList<NoticeVO> list = noticeService.getNoticeList(cri, "NOTICE");
		int totalCount = noticeService.getTotalCount(cri, "NOTICE");
		PageMaker pm = new PageMaker(totalCount, 2, cri);

		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.setViewName("/admin/noticeList");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/insert", method = RequestMethod.GET)
	public ModelAndView noticeInsertGet(ModelAndView mv) {
		mv.addObject("title", "고객센터 - 공지사항");
		mv.setViewName("/admin/noticeInsert");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/insert", method = RequestMethod.POST)
	public ModelAndView noticeInsertPost(ModelAndView mv, NoticeVO notice, 
			HttpServletResponse response, HttpSession session) {
		MemberVO user= (MemberVO)session.getAttribute("user");
		boolean res = noticeService.insertNotice(notice, user, "NOTICE");
		if(res)
			messageService.message(response, "공지사항 등록이 완료되었습니다.", "/innisfree/admin/notice/list");
		else
			messageService.message(response, "공지사항 등록에 실패했습니다.", "/innisfree/admin/notice/insert");
		return mv;
	}
	
	@RequestMapping(value = "/admin/notice/update", method = RequestMethod.GET)
	public ModelAndView noticeUpdateGet(ModelAndView mv, Integer no_num) {
		NoticeVO notice = noticeService.getNotice(no_num);
		mv.addObject("no", notice);
		mv.setViewName("/admin/noticeUpdate");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/update", method = RequestMethod.POST)
	public ModelAndView noticeUpdatePost(ModelAndView mv, NoticeVO notice,
			HttpServletResponse response, HttpSession session) {
		MemberVO user= (MemberVO)session.getAttribute("user");
		boolean res = noticeService.updateNotice(notice, user);
		if(res)
			messageService.message(response, "공지사항 수정이 완료되었습니다.", "/innisfree/admin/notice/list");
		else
			messageService.message(response, "공지사항 수정에 실패했습니다.", "/innisfree/admin/notice/list");
		return mv;
	}
	
	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public ModelAndView category(ModelAndView mv) {
		ArrayList<CategoryVO> list = productService.getCategoryList();
		mv.addObject("list",list);
		mv.setViewName("/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/category", method = RequestMethod.POST)
	public ModelAndView categoryPost(ModelAndView mv, CategoryVO category,
			HttpServletResponse response) throws IOException {
		int res = productService.insertCategory(category);

		messageService.categoryMessage(response, res);

		mv.setViewName("redirect:/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/category/ajax/get", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> categoryList(@RequestBody CategoryDTO cdto){
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		ArrayList<CategoryVO> list = productService.getCategoryList(cdto);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value = "/admin/product/list", method = RequestMethod.GET)
	public ModelAndView productListGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(2);
		ArrayList<ProductVO> list = productService.selectProductList(cri);
		int totalCount = productService.getProductTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		ArrayList<CategoryVO> categoryList = productService.getCategoryList();
		mv.addObject("cl", categoryList);
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.setViewName("/admin/productList");
		return mv;
	}
	@RequestMapping(value = "/admin/product/insert", method = RequestMethod.GET)
	public ModelAndView productInsertGet(ModelAndView mv) {
		ArrayList<CategoryVO> categoryList = productService.getCategoryList();
		mv.addObject("list", categoryList);
		mv.setViewName("/admin/productInsert");
		return mv;
	}
	@RequestMapping(value = "/admin/product/insert", method = RequestMethod.POST)
	public ModelAndView productInsertPost(ModelAndView mv, ProductVO product, MultipartFile file,
			HttpServletResponse response) {
		productService.insertProduct(product, file);
		messageService.message(response, "제품을 등록했습니다.", "/innisfree/admin/product/list");
		mv.setViewName("redirect:/admin/product/list");
		return mv;
	}
	
}