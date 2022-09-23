package kr.project.innisfree.dao;

import kr.project.innisfree.vo.MemberVO;

public interface MemberDAO {
	
	void insertMember(MemberVO member);

	MemberVO selectMember(String me_email);

}
