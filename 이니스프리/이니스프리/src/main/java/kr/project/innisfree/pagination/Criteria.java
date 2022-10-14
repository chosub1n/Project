package kr.project.innisfree.pagination;

import lombok.Data;

@Data
public class Criteria {
	private int page; 
	private int perPageNum;
	private String search;
	private String pr_mc_name;

	public Criteria() {
		page = 1;
		perPageNum = 10;
		search = "";
		pr_mc_name = "";
	}

	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}

}
