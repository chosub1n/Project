package kr.project.innisfree.vo;

import java.util.List;

import lombok.Data;

@Data
public class CategoryVO {
	private int lc_code;
	private int mc_code;
	private int sc_code;
	private int mc_lc_code;
	private int sc_mc_code;
	private String lc_name;
	private String sc_name;
	private String mc_name;
	private int sc_count;
	
	
	/*하위메뉴*/
	/*private List<CategoryVO> CategoryList;*/
	
}
