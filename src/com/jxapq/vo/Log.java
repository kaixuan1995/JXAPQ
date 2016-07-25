package com.jxapq.vo;

import java.util.Date;

public class Log {
	private Integer log_id; //
	private String log_content; // 操作内容
	private Date log_date; // 操作时间
	private String log_reason; // 原因
	private String log_who_fk; // 操作人员名称
	private int log_type;// 日志类型

	public Log() {
	}

	public Log(int log_id, String log_content, Date log_date,
			String log_reason, String log_who_fk, int log_type) {
		super();
		this.log_id = log_id;
		this.log_content = log_content;
		this.log_date = log_date;
		this.log_reason = log_reason;
		this.log_who_fk = log_who_fk;
		this.log_type = log_type;
	}

	public Log(String log_content, String log_who_fk, int log_type) {
		super();
		this.log_content = log_content;
		this.log_who_fk = log_who_fk;
		this.log_type = log_type;
	}

	public int getLog_id() {
		return log_id;
	}

	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}

	public String getLog_content() {
		return log_content;
	}

	public void setLog_content(String log_content) {
		this.log_content = log_content;
	}

	public Date getLog_date() {
		return log_date;
	}

	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}

	public String getLog_reason() {
		return log_reason;
	}

	public void setLog_reason(String log_reason) {
		this.log_reason = log_reason;
	}

	public String getLog_who_fk() {
		return log_who_fk;
	}

	public void setLog_who_fk(String log_who_fk) {
		this.log_who_fk = log_who_fk;
	}

	public int getLog_Type() {
		return log_type;
	}

	public void setLog_Type(int log_type) {
		this.log_type = log_type;
	}

	@Override
	public String toString() {
		return "Log [log_id=" + log_id + ", log_content=" + log_content
				+ ", log_date=" + log_date + ", log_reason=" + log_reason
				+ ", log_who_fk=" + log_who_fk + ", log_type=" + log_type + "]";
	}

}
