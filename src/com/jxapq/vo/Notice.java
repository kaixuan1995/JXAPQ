package com.jxapq.vo;


public class Notice {
	private int notice_id;			//编号
	private String notice_title;	//公告主题
	private String notice_content;	//公告内容
	private String notice_time;		//发布时间
	private int notice_onlyworksee; //是否仅工作人员可见。1.表示仅工作人员可见，2.表示都可以看见
	
	public Notice() {
		
	}
	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_time() {
		return notice_time;
	}

	public void setNotice_time(String notice_time) {
		this.notice_time = notice_time;
	}

	public int getNotice_onlyworksee() {
		return notice_onlyworksee;
	}

	public void setNotice_onlyworksee(int notice_onlyworksee) {
		this.notice_onlyworksee = notice_onlyworksee;
	}

	@Override
	public String toString() {
		return "Notice [notice_id=" + notice_id + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content
				+ ", notice_time=" + notice_time + ", notice_onlyworksee="
				+ notice_onlyworksee + "]";
	}
		
	
}
