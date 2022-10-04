package kr.project.innisfree.service;

import javax.servlet.http.HttpServletResponse;

public interface MessageService {

	void message(HttpServletResponse response, String content, String redirectUrl);

	void categoryMessage(HttpServletResponse response, int res);

}
