package kr.project.innisfree.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.project.innisfree.pagination.Criteria;
import kr.project.innisfree.pagination.PageMaker;
import kr.project.innisfree.service.MessageService;
import kr.project.innisfree.service.NoticeService;
import kr.project.innisfree.service.ProductService;
import kr.project.innisfree.vo.CategoryVO;
import kr.project.innisfree.vo.MemberVO;
import kr.project.innisfree.vo.NoticeVO;


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
}
