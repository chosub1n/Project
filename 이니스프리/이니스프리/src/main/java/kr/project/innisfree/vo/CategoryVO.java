package kr.project.innisfree.vo;

import lombok.Data;

@Data
public class CategoryVO {
	private int lc_code;
    private String lc_name;
    private int mc_code;
    private String mc_name;
    private int sc_code;
    private String sc_name;
    private int sc_count;
}
