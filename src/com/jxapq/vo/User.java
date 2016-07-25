package com.jxapq.vo;

import java.util.Date;

public class User extends People{
	private String user_id;			//账号
	private String user_name;		//真实姓名		
	private String user_birthday;		//出生日期
	private String user_called;		//职称
	private String user_sex;		//性别
	private String user_email;		//邮箱
	private String user_tel;		//电话
	private String user_password;	//密码
	private String user_code;		//邮箱激活码
	private boolean user_markcode;	//标记邮箱激活状态
	private String user_reason;		//申请原因
	private int user_type;			//用户类型:1.表示动物管理员，2.表示植物管理员，3.表示vip用户，4.表示申请为VIP的用户
	
	public User() {
		
	}
	
	public User(String user_name, String user_birthday, String user_called,
			String user_sex, String user_email, String user_tel,
			String user_password, String user_repasswrod, String user_code,
			boolean user_markcode, String user_reason, int user_type) {
		super();
		this.user_name = user_name;
		this.user_birthday = user_birthday;
		this.user_called = user_called;
		this.user_sex = user_sex;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.user_password = user_password;
		this.user_code = user_code;
		this.user_markcode = user_markcode;
		this.user_reason = user_reason;
		this.user_type = user_type;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_called() {
		return user_called;
	}

	public void setUser_called(String user_called) {
		this.user_called = user_called;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public boolean getUser_markcode() {
		return user_markcode;
	}

	public void setUser_markcode(boolean user_markcode) {
		this.user_markcode = user_markcode;
	}

	public String getUser_reason() {
		return user_reason;
	}

	public void setUser_reason(String user_reason) {
		this.user_reason = user_reason;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

}