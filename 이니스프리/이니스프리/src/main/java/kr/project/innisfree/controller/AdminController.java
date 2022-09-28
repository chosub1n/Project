package kr.project.innisfree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.addObject("title", "이니스프리 | Innisfree - 관리자");
		mv.setViewName("/admin/home");
		return mv;
	}
}
