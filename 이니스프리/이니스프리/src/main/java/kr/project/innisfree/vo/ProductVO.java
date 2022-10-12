package kr.project.innisfree.vo;

import lombok.Data;

@Data
public class ProductVO {
	private String pr_code;
	private String pr_thumb;
	private String pr_title;
	private String pr_title_detail;
	private String pr_content;
	private String pr_point;
	private String pr_line;
	private String pr_worry;	
	private int pr_price;
	private int pr_deli;
	private int pr_amount;
	private String pr_mc_name;
}