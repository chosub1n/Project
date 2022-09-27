package kr.project.innisfree.service;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.project.innisfree.dao.MemberDAO;
import kr.project.innisfree.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private String createRandom(String str, int count) {
		if(str == null)
			return "";
		String randomStr = "";

		for(int i = 0; i<count; i++) {
			int r = (int)(Math.random()*str.length());
			randomStr += str.charAt(r);
		}
		return randomStr;
	}

	@Override
	public boolean signup(MemberVO member) {
		if(member == null)
			return false;
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String me_code = createRandom(str, 6);
		member.setMe_code(me_code);
		String newPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(newPw);
		try {
			memberDao.insertMember(member);
			//메일로 링크를 보내줌
			String title = "이니스프리 회원가입을 축하합니다.";
			String content =
					"이메일 인증을 하여 계정을 활성화 하세요. 아래 링크를 클릭해주세요.<br>" +
					"<a href='http://localhost:8080/innisfree/signup/check?me_code="+ me_code+"&me_email="+member.getMe_email()+"'>" + 
							"http://localhost:8080/innisfree/signup/check?me_code="+me_code+"&me_email="+member.getMe_email()+
					"</a>";
			sendEmail(title, content, member.getMe_email());
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	
	@Override
	public boolean isUser(MemberVO member) {
		if(member == null || member.getMe_email() == null)
			return false;
		MemberVO dbMember = memberDao.selectMember(member.getMe_email());
		if(dbMember != null)
			return false;
		return true;
	}
	
	@Override
	public boolean sendEmail(String title, String content, String receiver) {
		try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		          = new MimeMessageHelper(message, true, "UTF-8");

		      messageHelper.setFrom("jsubin0110@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(receiver);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content, true);  // 메일 내용

		    mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}
			return false;
	}

	@Override
	public boolean emailActive(MemberVO member) {
		if(member == null || member.getMe_email() == null || member.getMe_code() == null)
			return false;
		MemberVO user = memberDao.selectMember(member.getMe_email());
		if(user == null)
			return false;

		if(user.getMe_pos_count() > 5)
			return false;

		if(user.getMe_pos() == 1)
			return true;

		if(user.getMe_code().equals(member.getMe_code())) {
			memberDao.updatePos(user.getMe_email(), "1");
			return true;
		}
		memberDao.updatePosCount(user.getMe_email());
		return false;
	}

	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_email() == null || member.getMe_pw() == null)
			return null;
		MemberVO user = memberDao.selectMember(member.getMe_email());
		if(user == null)
			return null;

		if(user.getMe_pos() != 1)
			return null;
		
		user.setAutoLogin(member.isAutoLogin());

		if(passwordEncoder.matches(member.getMe_pw(), user.getMe_pw()))
			return user;
		return null;
	}

	@Override
	public void updateMemberSession(MemberVO user) {
		if(user == null || user.getMe_email() == null)
			return;
		memberDao.updateMemberSession(user);		
	}
	
	@Override
	public MemberVO loginBySession(String me_s_email) {
		if(me_s_email == null)
			return null;
		return memberDao.selectBySession(me_s_email);
	}

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		if(request == null)
			return;
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null)
			return ;
		session.removeAttribute("user");
		Cookie cookie = WebUtils.getCookie(request, "innisfreeCookie");
		if(cookie == null || response == null)
			return;
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		user.setMe_s_email(null);
		user.setMe_s_limit(null);
		memberDao.updateMemberSession(user);
		
	}
	
	@Override
	public boolean updateMember(MemberVO member, MemberVO user) {
		if(member == null || user == null)
			return false;
		user.setMe_birth(member.getMe_birth());
		user.setMe_email(member.getMe_email());

		if(member.getMe_pw()!=null && member.getMe_pw().length() != 0) {
			String encPw = passwordEncoder.encode(member.getMe_pw());
			user.setMe_pw(encPw);
		}

		if(member.getMe_authority() != 0)
			user.setMe_authority(member.getMe_authority());

		memberDao.updateMember(user);
		return true;
	}

	@Override
	public boolean findPw(MemberVO member) {
		if(member== null || member.getMe_email() == null 
				|| member.getMe_birth() == null)
			return false;

		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String newPw = "";

		for(int i = 0; i<8; i++) {
			int r = (int)(Math.random()*str.length());
			newPw += str.charAt(r);
		}

		String encPw = passwordEncoder.encode(newPw);
		member.setMe_pw(encPw);
		memberDao.updateMember(member);

		String title = "새 비밀번호가 발급됐습니다.";
		String content = "새 비밀번호는 <br>" + newPw + "</br> 입니다.";

		return sendEmail(member.getMe_email(), title, content);
	}


}
