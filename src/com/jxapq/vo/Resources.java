package com.jxapq.vo;

/*
 * 站内资源
 * 
 */
public class Resources {
	private String name;    //资源名称
	private String number;  //资源数量
	
	public Resources() {
	}
	public Resources(String name, String number) {
		this.name = name;
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "Resources [name=" + name + ", number=" + number + "]";
	}
	
}