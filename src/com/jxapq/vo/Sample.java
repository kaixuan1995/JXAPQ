package com.jxapq.vo;

public class Sample {
	private int sample_id;					//标本id
	private String sample_place;			//标本地址	
	private String sample_time;				//标本采集时间
	private String sample_discover;			//标本采集人
	private String sample_identifier;		//标本鉴定人
	private String sample_identime;			//标本鉴定时间
	private String sample_altitude;			//海拔
	private String sample_summarize;		//概况
	private String sample_comment;			//备注
	private int species_id_fk;				//种ID
	public int getSample_id() {
		return sample_id;
	}
	public void setSample_id(int sample_id) {
		this.sample_id = sample_id;
	}
	public String getSample_place() {
		return sample_place;
	}
	public void setSample_place(String sample_place) {
		this.sample_place = sample_place;
	}
	public String getSample_time() {
		return sample_time;
	}
	public void setSample_time(String sample_time) {
		this.sample_time = sample_time;
	}
	public String getSample_discover() {
		return sample_discover;
	}
	public void setSample_discover(String sample_discover) {
		this.sample_discover = sample_discover;
	}
	public String getSample_identifier() {
		return sample_identifier;
	}
	public void setSample_identifier(String sample_identifier) {
		this.sample_identifier = sample_identifier;
	}
	public String getSample_identime() {
		return sample_identime;
	}
	public void setSample_identime(String sample_identime) {
		this.sample_identime = sample_identime;
	}
	public String getSample_altitude() {
		return sample_altitude;
	}
	public void setSample_altitude(String sample_altitude) {
		this.sample_altitude = sample_altitude;
	}
	public String getSample_summarize() {
		return sample_summarize;
	}
	public void setSample_summarize(String sample_summarize) {
		this.sample_summarize = sample_summarize;
	}
	public String getSample_comment() {
		return sample_comment;
	}
	public void setSample_comment(String sample_comment) {
		this.sample_comment = sample_comment;
	}
	public int getSpecies_id_fk() {
		return species_id_fk;
	}
	public void setSpecies_id_fk(int species_id_fk) {
		this.species_id_fk = species_id_fk;
	}
	
	
		
}
