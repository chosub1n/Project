package kr.project.innisfree.service;

import java.util.ArrayList;

import kr.project.innisfree.pagination.Criteria;
import kr.project.innisfree.vo.MemberVO;
import kr.project.innisfree.vo.NoticeVO;

public interface NoticeService {
	
	boolean insertNotice(NoticeVO notice, MemberVO user, String no_type);

	ArrayList<NoticeVO> getNoticeList(Criteria cri, String no_type);

	int getTotalCount(Criteria cri, String no_type);

	boolean deleteNotice(Integer no_num, MemberVO user);

	String getDeleteRedirectURL(String no_type);


}
