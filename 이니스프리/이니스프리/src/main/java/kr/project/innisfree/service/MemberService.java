package kr.project.innisfree.service;

import kr.project.innisfree.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	boolean isUser(MemberVO member);

	boolean sendEmail(String title, String content, String writer);
	
	boolean emailActive(MemberVO member);
}
