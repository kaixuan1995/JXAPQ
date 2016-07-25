package com.jxapq.vo;

public class Species_Dynamic {

	
	private int pdynamics_id;		//种群动态id
	private String pdynamics_time;		//记录时间
	private int pdynamics_number;		//种群数量
	private String pdynamics_place;		//种群具体地点
	private String pdynamics_summarize;	//动态描述
	private int development_fk;			//发展趋势外键
	private int species_id_fk;			//种外键
	private String dictionary_name;
	
	
	public int getPdynamics_id() {
		return pdynamics_id;
	}
	public void setPdynamics_id(int pdynamics_id) {
		this.pdynamics_id = pdynamics_id;
	}
	
	public String getPdynamics_time() {
		return pdynamics_time;
	}
	public void setPdynamics_time(String pdynamics_time) {
		this.pdynamics_time = pdynamics_time;
	}
	public int getPdynamics_number() {
		return pdynamics_number;
	}
	public void setPdynamics_number(int pdynamics_number) {
		this.pdynamics_number = pdynamics_number;
	}
	
	public String getPdynamics_place() {
		return pdynamics_place;
	}
	public void setPdynamics_place(String pdynamics_place) {
		this.pdynamics_place = pdynamics_place;
	}
	public String getPdynamics_summarize() {
		return pdynamics_summarize;
	}
	public void setPdynamics_summarize(String pdynamics_summarize) {
		this.pdynamics_summarize = pdynamics_summarize;
	}
	public int getDevelopment_fk() {
		return development_fk;
	}
	public void setDevelopment_fk(int development_fk) {
		this.development_fk = development_fk;
	}
	public int getSpecies_id_fk() {
		return species_id_fk;
	}
	public void setSpecies_id_fk(int species_id_fk) {
		this.species_id_fk = species_id_fk;
	}
	public String getDictionary_name() {
		return dictionary_name;
	}
	public void setDictionary_name(String dictionary_name) {
		this.dictionary_name = dictionary_name;
	}
	
	
	
}
