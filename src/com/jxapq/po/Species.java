package com.jxapq.po;

public class Species {
	private String species_id;							//种id
	private String species_cname;					//中文名
	private String species_ename;					//英文名
	private String species_spelling;				//种拼音
	private String species_addword;					//种加词
	private String sname;					//种学名
	private String species_commonInfo;				//种俗名
	private String species_level;					//分类等级
	private String species_synonym;					//异名信息
	private String species_discover;				//种发现人				
	private String species_summarize;				//形态特征
	
	private String species_habitat;					//生境
	private String species_geodist;					//地理分布型
	private String species_resitype;				//居留型
	private String species_intculti;				//引种栽培
	//private String subreginal;						//区系类型
	
	private String species_lifetype;				//生活型
	private String species_feedstate;				//饲养状况
	private String species_coupro;					//国家保护等级					
	private String species_iucn;					//IUCN物种红色名录
	private String species_provpro;					//省保护级别
	
	private String species_cites;					//CITES附录
	private String species_credpro;					//中国物种红色名录
	private String species_three;					//三有物种
	private String species_onlychina;				//中国特有
	private String subreginal_name;					//子区系类型
	private String picture_url;
	private String url;
	
	
	private String reginal_name;					//区系类型
	private String subspecies_addword;				//变种加词
	private String subspecies_discover;				//变种发现人
	private String subspeciessign;					//变种符号
	private String protection_name;					//保护区
	
	private String distribute_name;					//分布地
	private String species_habit;					//习性
	private String species_used;					//用途
	private String species_nationdist;				//国家分布地
	private String species_chinadist;				//中国分布
	
	private String species_literature;				//参考文献
	private String fucus_id_fk;						//属id
	

	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
	
//	public String getSubreginal() {
//		return subreginal;
//	}
//	public void setSubreginal(String subreginal) {
//		this.subreginal = subreginal;
//	}
//	public String getFucus_SName() {
//		return fucus_SName;
//	}
//	public void setFucus_SName(String fucus_SName) {
//		this.fucus_SName = fucus_SName;
//	}
	
	
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
	public String getSpecies_ename() {
		return species_ename;
	}
	public void setSpecies_ename(String species_ename) {
		this.species_ename = species_ename;
	}
	public String getSpecies_spelling() {
		return species_spelling;
	}
	public void setSpecies_spelling(String species_spelling) {
		this.species_spelling = species_spelling;
	}
	public String getSpecies_addword() {
		return species_addword;
	}
	public void setSpecies_addword(String species_addword) {
		this.species_addword = species_addword;
	}
	public String getSpecies_commonInfo() {
		return species_commonInfo;
	}
	public void setSpecies_commonInfo(String species_commonInfo) {
		this.species_commonInfo = species_commonInfo;
	}
	public String getSpecies_level() {
		return species_level;
	}
	public void setSpecies_level(String species_level) {
		this.species_level = species_level;
	}
	public String getSpecies_synonym() {
		return species_synonym;
	}
	public void setSpecies_synonym(String species_synonym) {
		this.species_synonym = species_synonym;
	}
	public String getSpecies_discover() {
		return species_discover;
	}
	public void setSpecies_discover(String species_discover) {
		this.species_discover = species_discover;
	}
	public String getSpecies_summarize() {
		return species_summarize;
	}
	public void setSpecies_summarize(String species_summarize) {
		this.species_summarize = species_summarize;
	}
	public String getSpecies_habitat() {
		return species_habitat;
	}
	public void setSpecies_habitat(String species_habitat) {
		this.species_habitat = species_habitat;
	}
	public String getSpecies_geodist() {
		return species_geodist;
	}
	public void setSpecies_geodist(String species_geodist) {
		this.species_geodist = species_geodist;
	}
	public String getSpecies_resitype() {
		return species_resitype;
	}
	public void setSpecies_resitype(String species_resitype) {
		this.species_resitype = species_resitype;
	}
	public String getSpecies_intculti() {
		return species_intculti;
	}
	public void setSpecies_intculti(String species_intculti) {
		this.species_intculti = species_intculti;
	}
	public String getSpecies_lifetype() {
		return species_lifetype;
	}
	public void setSpecies_lifetype(String species_lifetype) {
		this.species_lifetype = species_lifetype;
	}
	public String getSpecies_feedstate() {
		return species_feedstate;
	}
	public void setSpecies_feedstate(String species_feedstate) {
		this.species_feedstate = species_feedstate;
	}
	public String getSpecies_coupro() {
		return species_coupro;
	}
	public void setSpecies_coupro(String species_coupro) {
		this.species_coupro = species_coupro;
	}
	public String getSpecies_iucn() {
		return species_iucn;
	}
	public void setSpecies_iucn(String species_iucn) {
		this.species_iucn = species_iucn;
	}
	public String getSpecies_provpro() {
		return species_provpro;
	}
	public void setSpecies_provpro(String species_provpro) {
		this.species_provpro = species_provpro;
	}
	public String getSpecies_cites() {
		return species_cites;
	}
	public void setSpecies_cites(String species_cites) {
		this.species_cites = species_cites;
	}
	public String getSpecies_credpro() {
		return species_credpro;
	}
	public void setSpecies_credpro(String species_credpro) {
		this.species_credpro = species_credpro;
	}
	public String getSpecies_three() {
		return species_three;
	}
	public void setSpecies_three(String species_three) {
		this.species_three = species_three;
	}
	public String getSpecies_onlychina() {
		return species_onlychina;
	}
	public void setSpecies_onlychina(String species_onlychina) {
		this.species_onlychina = species_onlychina;
	}
	public String getSubreginal_name() {
		return subreginal_name;
	}
	public void setSubreginal_name(String subreginal_name) {
		this.subreginal_name = subreginal_name;
	}
	public String getReginal_name() {
		return reginal_name;
	}
	public void setReginal_name(String reginal_name) {
		this.reginal_name = reginal_name;
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
	public String getSubspeciessign() {
		return subspeciessign;
	}
	public void setSubspeciessign(String subspeciessign) {
		this.subspeciessign = subspeciessign;
	}
	public String getProtection_name() {
		return protection_name;
	}
	public void setProtection_name(String protection_name) {
		this.protection_name = protection_name;
	}
	public String getDistribute_name() {
		return distribute_name;
	}
	public void setDistribute_name(String distribute_name) {
		this.distribute_name = distribute_name;
	}
	public String getSpecies_habit() {
		return species_habit;
	}
	public void setSpecies_habit(String species_habit) {
		this.species_habit = species_habit;
	}
	public String getSpecies_used() {
		return species_used;
	}
	public void setSpecies_used(String species_used) {
		this.species_used = species_used;
	}
	public String getSpecies_nationdist() {
		return species_nationdist;
	}
	public void setSpecies_nationdist(String species_nationdist) {
		this.species_nationdist = species_nationdist;
	}
	public String getSpecies_chinadist() {
		return species_chinadist;
	}
	public void setSpecies_chinadist(String species_chinadist) {
		this.species_chinadist = species_chinadist;
	}
	public String getSpecies_literature() {
		return species_literature;
	}
	public void setSpecies_literature(String species_literature) {
		this.species_literature = species_literature;
	}
//	public String getSpecies_sname() {
//		return species_sname;
//	}
//	public void setSpecies_sname(String species_sname) {
//		this.species_sname = species_sname;
//	}
	public String getFucus_id_fk() {
		return fucus_id_fk;
	}
	public void setFucus_id_fk(String fucus_id_fk) {
		this.fucus_id_fk = fucus_id_fk;
	}	
	
}
