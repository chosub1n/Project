package kr.project.innisfree.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.project.innisfree.service.MessageService;
import kr.project.innisfree.service.NoticeService;
import kr.project.innisfree.vo.MemberVO;

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
			messageService.message(response, "게시글이 삭제되었습니다.", redirectUrl);
		else
			messageService.message(response, "게시글 삭제에 실패했습니다.", redirectUrl);
		return mv;
	}

}
