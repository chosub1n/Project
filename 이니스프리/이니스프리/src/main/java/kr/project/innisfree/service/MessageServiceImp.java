package kr.project.innisfree.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public class MessageServiceImp implements MessageService{

	@Override
	public void message(HttpServletResponse response, String content, String redirectUrl) {
		if(response == null)
			return;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;		
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
		out.println("<script>alert('"+content+"');location.href='"+redirectUrl+"'</script>");
		out.flush();
	}

	@Override
	public void categoryMessage(HttpServletResponse response, int res) {
		String redirectUrl = "/innisfree/admin/category";
		switch (res) {
		case 1:		message(response,"카테고리코드는 4글자이어야 합니다.",redirectUrl);	break;//code길이가 4이 아님
		case -2:	message(response,"카테고리명 또는 카테고리코드가 입력되지 않았습니다.",redirectUrl);break;//null
		default:
			message(response,"카테고리가 등록되었습니다.",redirectUrl);
		}
			
	}


}
