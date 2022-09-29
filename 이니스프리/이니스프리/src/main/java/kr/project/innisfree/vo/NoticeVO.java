package kr.project.innisfree.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int no_num;
	private String no_type;
	private String no_title;
	private String no_content;
	private Date no_reg_date;
	private String no_me_email;

	public String getNo_reg_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(no_reg_date);
	}
	
}
