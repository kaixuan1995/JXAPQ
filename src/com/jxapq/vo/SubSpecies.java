package com.jxapq.vo;

import com.jxapq.annotation.FieldAnnotation;

public class SubSpecies {
	
	private String subspecies_id;
	@FieldAnnotation(fname="subspecies_addword",cname="亚种（亚种、变种、变型种、品种）加词")
	private String subspecies_addword;
	@FieldAnnotation(fname="subspecies_discover",cname="亚种（变型、变种）命名人")
	private String subspecies_discover;
	@FieldAnnotation(fname="subspeciessign_fk",cname="变种符号代码")
	private String subspeciessign_fk;
	
	private String species_id_fk;

	public String getSubspecies_id() {
		return subspecies_id;
	}

	public void setSubspecies_id(String subspecies_id) {
		this.subspecies_id = subspecies_id;
	}

	public String getSubspecies_addword() {
		return subspecies_addword;
	}

	public void setSubspecies_addword(String subspecies_addword) {
		this.subspecies_addword = subspecies_addword;
	}

	public String getSubspecies_discover() {
		return subspecies_discover;
	}

	public void setSubspecies_discover(String subspecies_discover) {
		this.subspecies_discover = subspecies_discover;
	}

	public String getSubspeciessign_fk() {
		return subspeciessign_fk;
	}

	public void setSubspeciessign_fk(String subspeciessign_fk) {
		this.subspeciessign_fk = subspeciessign_fk;
	}

	public String getSpecies_id_fk() {
		return species_id_fk;
	}

	public void setSpecies_id_fk(String species_id_fk) {
		this.species_id_fk = species_id_fk;
	}
	
	

}
