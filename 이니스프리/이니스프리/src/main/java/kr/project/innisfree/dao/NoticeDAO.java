package kr.project.innisfree.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.project.innisfree.pagination.Criteria;
import kr.project.innisfree.vo.NoticeVO;

public interface NoticeDAO {
	
	int insertNotice(NoticeVO Notice);

	ArrayList<NoticeVO> selectNoticeList(@Param("cri")Criteria cri, @Param("no_type")String no_type);

	int selectNoticeTotalCount(@Param("cri")Criteria cri, @Param("no_type")String no_type);

}
