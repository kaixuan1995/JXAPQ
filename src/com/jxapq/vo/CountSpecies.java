package com.jxapq.vo;

public class CountSpecies {
	private String species_id;						//种id
	private String species_cname;					//中文名			
	private String species_addword;					//种加词			
	private String species_discover;				//种发现人
	
	public CountSpecies() {}
	public CountSpecies(String species_id, String species_cname,
			String species_addword, String species_discover) {
		this.species_id = species_id;
		this.species_cname = species_cname;
		this.species_addword = species_addword;
		this.species_discover = species_discover;
	}
	public String getSpecies_id() {
		return species_id;
	}
	public void setSpecies_id(String species_id) {
		this.species_id = species_id;
	}
	public String getSpecies_cname() {
		return species_cname;
	}
	public void setSpecies_cname(String species_cname) {
		this.species_cname = species_cname;
	}
	public String getSpecies_addword() {
		return species_addword;
	}
	public void setSpecies_addword(String species_addword) {
		this.species_addword = species_addword;
	}
	public String getSpecies_discover() {
		return species_discover;
	}
	public void setSpecies_discover(String species_discover) {
		this.species_discover = species_discover;
	}
	
}
