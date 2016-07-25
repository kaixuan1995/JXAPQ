package com.jxapq.vo;

public class Species_distribute {
	private int distribute_id;			
	private int species_id_fk;			//种外键
	private int country_id_fk;			//县外键
	public int getDistribute_id() {
		return distribute_id;
	}
	public void setDistribute_id(int distribute_id) {
		this.distribute_id = distribute_id;
	}
	public int getSpecies_id_fk() {
		return species_id_fk;
	}
	public void setSpecies_id_fk(int species_id_fk) {
		this.species_id_fk = species_id_fk;
	}
	public int getCountry_id_fk() {
		return country_id_fk;
	}
	public void setCountry_id_fk(int country_id_fk) {
		this.country_id_fk = country_id_fk;
	}
	
	
}
