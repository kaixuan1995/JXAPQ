package com.jxapq.service.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

import com.jxapq.exception.UtilException;
import com.jxapq.po.Species;
import com.jxapq.service.util.CreateFileURL;

public class SimpleDocument {

	/**
	 * @param species  com.jxapq.po.Species;
	 * @param URL	在servlet里面写String url = getServletContext().getRealPath("");
	 * @return
	 * @throws UtilException
	 */
	public static String getSpeciesDoc(List<Species> speciess,String URL,HttpServletResponse response) throws UtilException {
		FileInputStream is = null;
		FileOutputStream os = null;
		HWPFDocument doc;
		if(speciess.size()!=1) {
			throw new UtilException("一次导出world文档不能超过两个种");
		}else {
			for(Species species:speciess) {
				try {
					is = new FileInputStream(URL+File.separator+"Outdoc"+File.separator+"Species.doc");
					doc = new HWPFDocument(is);
					Range range = doc.getRange();
					//调用替换文本
					replace(range,species);
				} catch (Exception e) {
					throw new UtilException("查找的doc模板不存在");
				}finally{
					new SimpleDocument().closeDoc(is,os);
				}
				//文件输出流
				String temp = CreateFileURL.createSignURL();
				URL = CreateFileURL.createFile(URL+File.separator+"temple"+File.separator+temp+File.separator);
				try {
					os = new FileOutputStream(URL+"SpeciesTemple.doc");
					// 把doc输出到输出流中
					doc.write(os);
					FileUtils.Output(URL+"SpeciesTemple.doc", response);
				} catch (Exception e) {
					throw new UtilException("导出的doc模板不存在");
				}finally{
					new SimpleDocument().closeDoc(is,os);
					OutputUtil.deleteFile(URL+"SpeciesTemple.doc");
				}
			}
		}
		return "";
	}
	
	
	public static void replace(Range range,Species species) {
		// 往doc文档中插入数据
		if(species.getSpecies_cname()!=null){
			range.replaceText("${species_cname}", species.getSpecies_cname());
		}
		if(species.getSpecies_commonInfo()!=null){
			range.replaceText("${species_commonInfo}",species.getSpecies_commonInfo());
		}
		if( species.getSpecies_ename()!=null){
			range.replaceText("${species_ename}", species.getSpecies_ename());
		}
		if(species.getSname()!=null){
			range.replaceText("${fucus_SName}",species.getSname());
		}
		if(species.getSpecies_addword()!=null){
			range.replaceText("${species_addword}",species.getSpecies_addword());
		}
		if(species.getSpecies_discover()!=null){
			range.replaceText("${species_discover}",species.getSpecies_discover());
		}
		if(species.getSpecies_synonym()!=null){
			range.replaceText("${species_synonym}",species.getSpecies_synonym());
		}
		if(species.getSubspeciessign()!=null) {
			range.replaceText("${subspeciessign}",species.getSubspeciessign());
		}
		if(species.getSubspecies_addword()!=null) {
			range.replaceText("${subspecies_addword}",species.getSubspecies_addword());
		}
		if(species.getSubspecies_discover()!=null) {
			range.replaceText("${subspecies_discover}",species.getSubspecies_discover());
		}
		if(species.getSpecies_level()!=null){
			range.replaceText("${species_level}",species.getSpecies_level());
		}
		if(species.getSpecies_summarize()!=null){
			range.replaceText("${species_summarize}",species.getSpecies_summarize());
		}
		if(species.getSpecies_habitat()!=null){
			range.replaceText("${species_habitat}",species.getSpecies_habitat());
		}
		if(species.getSpecies_geodist()!=null) {
			range.replaceText("${species_geodist}",species.getSpecies_geodist());
		}
		if(species.getSpecies_geodist()!=null){
			range.replaceText("${species_geodist}",species.getSpecies_geodist());
		}
		if(species.getSpecies_resitype()!=null){
			range.replaceText("${species_resitype}",species.getSpecies_resitype());
		}
		if(species.getSpecies_feedstate()!=null){
			range.replaceText("${species_feedstate}",species.getSpecies_feedstate());
		}
		if(species.getSpecies_habit()!=null){
			range.replaceText("${species_habit}", species.getSpecies_habit());
		}
		if(species.getSpecies_lifetype()!=null){
			range.replaceText("${species_lifetype}",species.getSpecies_lifetype());
		}
		if(species.getSubreginal_name()!=null){
			range.replaceText("${subreginal_name}", species.getSubreginal_name());
		}
		if(species.getSpecies_intculti()!=null){
			range.replaceText("${species_intculti}",species.getSpecies_intculti());
		}
		if(species.getSpecies_chinadist()!=null){
			range.replaceText("${species_chinadist}",species.getSpecies_chinadist());
		}
		if(species.getSpecies_nationdist()!=null) {
			range.replaceText("${species_nationdist}",species.getSpecies_nationdist());
		}
		if(species.getDistribute_name()!=null) {
			range.replaceText("${distribute_name}",species.getDistribute_name());
		}
		if(species.getSpecies_coupro()!=null){
			range.replaceText("${species_coupro}", species.getSpecies_coupro());
		}
		if(species.getSpecies_iucn()!=null){
			range.replaceText("${species_iucn}", species.getSpecies_iucn());
		}
		if(species.getSpecies_credpro()!=null){
			range.replaceText("${species_credpro}",species.getSpecies_credpro());
		}
		if(species.getSpecies_cites()!=null){
			range.replaceText("${species_cites}", species.getSpecies_cites());
		}
		if(species.getSpecies_used()!=null){
			range.replaceText("${species_used}", species.getSpecies_used());
		}
		if(species.getSpecies_three()!=null){
			range.replaceText("${species_three}", species.getSpecies_three());
		}
		if(species.getSpecies_onlychina()!=null){
			range.replaceText("${species_onlychina}",species.getSpecies_onlychina());
		}
		if(species.getSpecies_literature()!=null){
			range.replaceText("${species_literature}",species.getSpecies_literature());
		}

		
		
		
		
		
		
	}
	
	
	public void closeDoc(FileInputStream is,FileOutputStream os) throws UtilException {
		if (is != null) {
			try {
				is.close();
			} catch (IOException e) {
				throw new UtilException("关闭数据留失败");
			} finally {
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						throw new UtilException("关闭数据留失败");
					}
				}
			}
		}
	}
}

















