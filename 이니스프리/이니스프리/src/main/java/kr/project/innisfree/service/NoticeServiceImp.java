package kr.project.innisfree.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.innisfree.dao.NoticeDAO;
import kr.project.innisfree.pagination.Criteria;
import kr.project.innisfree.vo.MemberVO;
import kr.project.innisfree.vo.NoticeVO;

@Service
public class NoticeServiceImp implements NoticeService{
	
	@Autowired
	NoticeDAO noticeDao;

	@Override
	public boolean insertNotice(NoticeVO notice, MemberVO user, String no_type) {
		if(notice == null || notice.getNo_title() == null || notice.getNo_title().length() == 0 || notice.getNo_content() == null)
			return false;
		if(user == null)
			return false;
		notice.setNo_me_email(user.getMe_email());
		notice.setNo_type(no_type);
		return noticeDao.insertNotice(notice) == 1 ? true : false;
	}

	@Override
	public ArrayList<NoticeVO> getNoticeList(Criteria cri, String no_type) {
		if(no_type == null)
			return null;
		if(cri == null)
			cri = new Criteria();

		return noticeDao.selectNoticeList(cri,no_type);
	}

	@Override
	public int getTotalCount(Criteria cri, String no_type) {
		if(no_type == null)
			return 0;
		if(cri == null)
			cri = new Criteria();
		return noticeDao.selectNoticeTotalCount(cri,no_type);
	}

	@Override
	public boolean deleteNotice(Integer no_num, MemberVO user) {
		if(no_num == null || user == null)
			return false;
		NoticeVO notice = noticeDao.selectNotice(no_num);
		if(notice == null)
			return false;
		if(user.getMe_authority() != 10 && !notice.getNo_me_email().equals(user.getMe_email()))
			return false;

		return noticeDao.deleteNotice(no_num) == 1 ? true : false;
	}

	@Override
	public String getDeleteRedirectURL(String no_type) {
		if(no_type.equals("NOTICE"))
			return "/innisfree/admin/notice/list";
		return null;
	}

	@Override
	public NoticeVO getNotice(Integer no_num) {
		if(no_num == null)
			return null;
		return noticeDao.selectNotice(no_num);
	}

	@Override
	public boolean updateNotice(NoticeVO notice, MemberVO user) {
		if(notice == null || notice.getNo_title() == null || notice.getNo_title().length() == 0 || 
				notice.getNo_content() == null)
			return false;
		NoticeVO dbNotice = noticeDao.selectNotice(notice.getNo_num());
		if(dbNotice == null) 
			return false;

		if(user.getMe_authority() != 10 && !notice.getNo_me_email().equals(user.getMe_email()))
			return false;
		dbNotice.setNo_title(notice.getNo_title());
		dbNotice.setNo_content(notice.getNo_content());
		return noticeDao.updateNotice(dbNotice) == 1 ? true : false;
	}


}
