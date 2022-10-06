package kr.project.innisfree.vo;

import lombok.Data;

@Data
public class CategoryVO {
	private int lc_code;
    private String lc_name;
    private String mc_name;
    private String mc_pr_code;
    private int mc_count;
}