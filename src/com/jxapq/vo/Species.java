package com.jxapq.vo;

import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;

@AnnoTableName(tableName="t_species",length=30)
public class Species {
	
	@FieldAnnotation(fname="species_id",cname="*种id")
	private String species_id; // 种编号
	@FieldAnnotation(fname="species_cname",cname="*物种名")
	private String species_cname; // 中文名
	@FieldAnnotation(fname="species_spelling",cname="*物种拼音")
	private String species_spelling; // 种拼音
	@FieldAnnotation(fname="species_ename",cname="*物种英文名")
	private String species_ename; // 英文名
	@FieldAnnotation(fname="species_addword",cname="*种加词")
	private String species_addword; // 种加词
	@FieldAnnotation(fname="species_commoninfo",cname="俗名信息")
	private String species_commoninfo; // 种俗名
	@FieldAnnotation(fname="species_synonym",cname="*异名信息")
	private String species_synonym; // 异名信息
	@FieldAnnotation(fname="species_discover",cname="*命名人")
	private String species_discover; // 种发现人
	@FieldAnnotation(fname="species_summarize",cname="*概述(形态特种)")
	private String species_summarize; // 形态特征
	@FieldAnnotation(fname="species_level",cname="分类等级")
	private String species_level; // 分类等级
	@FieldAnnotation(fname="species_habitat",cname="生境")
	private String species_habitat; // 生境
	@FieldAnnotation(fname="species_geodist_fk",cname="地理分布型")
	private String species_geodist_fk; // 地理分布型
	@FieldAnnotation(fname="species_resitype_fk",cname="居留型(动)")
	private String species_resitype_fk; // 居留型
	@FieldAnnotation(fname="species_habit",cname="习性(动)")
	private String species_habit; // 习性
	@FieldAnnotation(fname="species_lifetype_fk",cname="*生活型(植)")
	private String species_lifetype_fk; // 生活型
	@FieldAnnotation(fname="species_feedstate_fk",cname="饲养状况")
	private String species_feedstate_fk; // 饲养状况
	@FieldAnnotation(fname="species_intculti_fk",cname="引种栽培(植)")
	private String species_intculti_fk; // 引种栽培
	@FieldAnnotation(fname="species_used",cname="用途")
	private String species_used; // 用途
	
	@FieldAnnotation(fname="species_coupro_fk",cname="*国家保护等级")
	private String species_coupro_fk; // 保护等级
	
	@FieldAnnotation(fname="species_iucn_fk",cname="*IUCN红色名录等级")
	private String species_iucn_fk; // IUCN物种红色名录
	@FieldAnnotation(fname="species_provpro_fk",cname="*省保护等级")
	private String species_provpro_fk; // 省保护级别
	@FieldAnnotation(fname="species_cites_fk",cname="*CITES保护等级")
	private String species_cites_fk; // CITES附录
	@FieldAnnotation(fname="species_credpro_fk",cname="*中国红色名录保护等级")
	private String species_credpro_fk; // 中国物种红色名录
	@FieldAnnotation(fname="species_three_fk",cname="*三有物种(是/否)")
	private String species_three_fk; // 三有物种
	@FieldAnnotation(fname="species_onlychina_fk",cname="*中国特有(是/否)")
	private String species_onlychina_fk = "1"; // 中国特有
	@FieldAnnotation(fname="species_nationdist",cname="国家分布")
	private String species_nationdist; // 国家分布地
	@FieldAnnotation(fname="species_chinadist",cname="国内分布")
	private String species_chinadist; // 中国分布
	@FieldAnnotation(fname="species_literature",cname="参考文献")
	private String species_literature; // 参考文献
	@FieldAnnotation(fname="subreginal_id_fk",cname="*子区系类型(id)")
	private String subreginal_id_fk; // 子区系类型
	@FieldAnnotation(fname="fucus_id_fk",cname="属外键")
	private String fucus_id_fk; // 属id
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
	public String getSpecies_spelling() {
		return species_spelling;
	}
	public void setSpecies_spelling(String species_spelling) {
		this.species_spelling = species_spelling;
	}
	public String getSpecies_ename() {
		return species_ename;
	}
	public void setSpecies_ename(String species_ename) {
		this.species_ename = species_ename;
	}
	public String getSpecies_addword() {
		return species_addword;
	}
	public void setSpecies_addword(String species_addword) {
		this.species_addword = species_addword;
	}
	public String getSpecies_commoninfo() {
		return species_commoninfo;
	}
	public void setSpecies_commoninfo(String species_commoninfo) {
		this.species_commoninfo = species_commoninfo;
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

	public String getSpecies_level() {
		return species_level;
	}
	public void setSpecies_level(String species_level) {
		this.species_level = species_level;
	}
	public String getSpecies_habitat() {
		return species_habitat;
	}
	public void setSpecies_habitat(String species_habitat) {
		this.species_habitat = species_habitat;
	}
	public String getSpecies_geodist_fk() {
		return species_geodist_fk;
	}
	public void setSpecies_geodist_fk(String species_geodist_fk) {
		this.species_geodist_fk = species_geodist_fk;
	}
	public String getSpecies_resitype_fk() {
		return species_resitype_fk;
	}
	public void setSpecies_resitype_fk(String species_resitype_fk) {
		this.species_resitype_fk = species_resitype_fk;
	}
	public String getSpecies_habit() {
		return species_habit;
	}
	public void setSpecies_habit(String species_habit) {
		this.species_habit = species_habit;
	}
	public String getSpecies_lifetype_fk() {
		return species_lifetype_fk;
	}
	public void setSpecies_lifetype_fk(String species_lifetype_fk) {
		this.species_lifetype_fk = species_lifetype_fk;
	}
	public String getSpecies_feedstate_fk() {
		return species_feedstate_fk;
	}
	public void setSpecies_feedstate_fk(String species_feedstate_fk) {
		this.species_feedstate_fk = species_feedstate_fk;
	}
	public String getSpecies_intculti_fk() {
		return species_intculti_fk;
	}
	public void setSpecies_intculti_fk(String species_intculti_fk) {
		this.species_intculti_fk = species_intculti_fk;
	}
	public String getSpecies_used() {
		return species_used;
	}
	public void setSpecies_used(String species_used) {
		this.species_used = species_used;
	}
	public String getSpecies_coupro_fk() {
		return species_coupro_fk;
	}
	public void setSpecies_coupro_fk(String species_coupro_fk) {
		this.species_coupro_fk = species_coupro_fk;
	}
	public String getSpecies_iucn_fk() {
		return species_iucn_fk;
	}
	public void setSpecies_iucn_fk(String species_iucn_fk) {
		this.species_iucn_fk = species_iucn_fk;
	}
	public String getSpecies_provpro_fk() {
		return species_provpro_fk;
	}
	public void setSpecies_provpro_fk(String species_provpro_fk) {
		this.species_provpro_fk = species_provpro_fk;
	}
	public String getSpecies_cites_fk() {
		return species_cites_fk;
	}
	public void setSpecies_cites_fk(String species_cites_fk) {
		this.species_cites_fk = species_cites_fk;
	}
	public String getSpecies_credpro_fk() {
		return species_credpro_fk;
	}
	public void setSpecies_credpro_fk(String species_credpro_fk) {
		this.species_credpro_fk = species_credpro_fk;
	}
	public String getSpecies_three_fk() {
		return species_three_fk;
	}
	public void setSpecies_three_fk(String species_three_fk) {
		this.species_three_fk = species_three_fk;
	}
	public String getSpecies_onlychina_fk() {
		return species_onlychina_fk;
	}
	public void setSpecies_onlychina_fk(String species_onlychina_fk) {
		this.species_onlychina_fk = species_onlychina_fk;
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
	public String getSubreginal_id_fk() {
		return subreginal_id_fk;
	}
	public void setSubreginal_id_fk(String subreginal_id_fk) {
		this.subreginal_id_fk = subreginal_id_fk;
	}
	public String getFucus_id_fk() {
		return fucus_id_fk;
	}
	public void setFucus_id_fk(String fucus_id_fk) {
		this.fucus_id_fk = fucus_id_fk;
	}
	
	

}
