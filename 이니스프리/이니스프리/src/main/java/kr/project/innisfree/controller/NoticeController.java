package kr.project.innisfree.controller;

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
import kr.project.innisfree.vo.MemberVO;
import kr.project.innisfree.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	MessageService messageService;

	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public ModelAndView noticeDeletePost(ModelAndView mv, Integer no_num, HttpSession session,
			HttpServletResponse response, String no_type) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = noticeService.deleteNotice(no_num, user);
		String redirectUrl = noticeService.getDeleteRedirectURL(no_type);
		if(res)
			messageService.message(response, "공지사항이 삭제되었습니다.", redirectUrl);
		else
			messageService.message(response, "공지사항 삭제에 실패했습니다.", redirectUrl);
		return mv;
	}
	
	@RequestMapping(value = "/notice/select", method = RequestMethod.GET)
	public ModelAndView noticeSelectGet(ModelAndView mv, Integer no_num) {
		NoticeVO notice = noticeService.getNotice(no_num);
		mv.addObject("no", notice);
		mv.setViewName("/notice/select");
		return mv;
	}
	
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public ModelAndView noticeListGet(ModelAndView mv, String no_type, Criteria cri) {
		ArrayList<NoticeVO> list = noticeService.getNoticeList(cri, no_type);
		int totalCount = noticeService.getTotalCount(cri, no_type);
		PageMaker pm = new PageMaker(totalCount, 5, cri);

		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.addObject("no_type", no_type);
		mv.setViewName("/notice/list");
		return mv;
	}

}
