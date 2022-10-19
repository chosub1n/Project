package kr.project.innisfree.vo;

import java.text.DecimalFormat;

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
	private String pr_count;
	
	public String getPr_thumb_url() {
		return "/product/img" + pr_thumb;
	}
	
	public String getPr_price_str() {
		if(pr_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(pr_price) + "원";
	}
}