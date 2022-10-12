package kr.project.innisfree.vo;

import java.text.DecimalFormat;

import lombok.Data;

@Data
public class CategoryVO {
	private int lc_code;
    private String lc_name;
    private String mc_name;
    private String mc_pr_code;
    private int mc_count;
    
    public String getPr_code() {
    	DecimalFormat df = new DecimalFormat("000");
    	return mc_pr_code + df.format(mc_count+1);
    }
}
