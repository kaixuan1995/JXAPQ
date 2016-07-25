package com.jxapq.vo;

public class Species_Protection {
	private int speciesprotection_id;			//种保护区id
	private int protection_id_fk;				//保护区外键
	private int species_id_fk;					//种外键
	public int getSpeciesprotection_id() {
		return speciesprotection_id;
	}
	public void setSpeciesprotection_id(int speciesprotection_id) {
		this.speciesprotection_id = speciesprotection_id;
	}
	public int getProtection_id_fk() {
		return protection_id_fk;
	}
	public void setProtection_id_fk(int protection_id_fk) {
		this.protection_id_fk = protection_id_fk;
	}
	public int getSpecies_id_fk() {
		return species_id_fk;
	}
	public void setSpecies_id_fk(int species_id_fk) {
		this.species_id_fk = species_id_fk;
	}
	
	
}
