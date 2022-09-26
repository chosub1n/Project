package kr.project.innisfree.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String me_email;
	private String me_pw;
	private String me_name;
	private String me_phonenum;
	private String me_post_code;
	private String me_addr;
	private String me_addr_detail;
	private String me_s_email;
	private String me_code;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date me_birth;
	private Date me_s_limit;
	private int me_pos;
	private int me_pos_count;
	private int me_authority;
	private int me_gr_num;
	private boolean autoLogin;
	
	public String getMe_birth_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(me_birth);
	}
}
