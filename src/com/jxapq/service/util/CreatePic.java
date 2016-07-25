package com.jxapq.service.util;

import java.awt.Font;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import com.jxapq.exception.UtilException;

public class CreatePic {
	/**
	 * 得到统计的Count对象，对立面的数据进行解析，生成用于生成柱状统计图的数据
	 * @param list:count对象
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private static DefaultCategoryDataset createDataSet(List list) throws UtilException {
		//实例化defaultCategoryDataset对象
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
		//添加数据
		String s[][] = new String[list.size()][];
		try {
			s= Reflex.reflex(list);
		} catch (UtilException e) {
			throw new UtilException("没有该实例对象");
		}	
		for(int i = 0;i<s.length;i++) {
			System.out.println(s[i][0]+"\t"+s[i][1]+"\t"+s[i][1]);
			dataSet.addValue(Integer.parseInt(s[i][0]), s[i][1], s[i][1]);
		}
		return dataSet;
		
	}
	
	
	/**
	 * 用于生成柱状图的统计
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	public JFreeChart createChart(List list) throws UtilException {
		List list1 = Reflex.getStatisInfo(list);
		StandardChartTheme standardChartTheme = new StandardChartTheme("CN");		//创建主题样式
		standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));			//设置标题字体
		standardChartTheme.setRegularFont(new Font("微软雅黑",Font.PLAIN,15));		//设置图例的字体
		standardChartTheme.setLargeFont(new Font("微软雅黑",Font.PLAIN,15));			//设置轴向的字体
		ChartFactory.setChartTheme(standardChartTheme);
		//通过chartFactory 创建JFreeChart
		JFreeChart chart = ChartFactory.createBarChart3D(
				"动植物信息统计柱状图",													//图表标题
				"统计类型", 															//横轴标题
				"统计数量", 															//纵轴标题
				createDataSet(list1), 												//数据集合
				PlotOrientation.VERTICAL, 											//图标方向
				false, 																//是否显示图例标识
				false,																//是否显示tooltips
				false);																//是否支持超链接
		
		return chart;
	}
	
	/**
	 * 解析List对象，得到生成饼状图的数据
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private DefaultPieDataset createPieDateSet(List list) throws UtilException {
		DefaultPieDataset  dataSet = new DefaultPieDataset();
		//添加数据
		String s[][] = new String[list.size()][];
		try {
			s= Reflex.reflex(list);
		} catch (UtilException e) {
			throw new UtilException("没有该实例对象");
		}	
		for(int i = 0;i<s.length;i++) {	
			dataSet.setValue(s[i][1],Double.parseDouble(s[i][0]));
			
		}
		return dataSet;
		
	}
	
	/**
	 * 生成饼状图
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	public JFreeChart createPie(List list) throws UtilException{
		List list1 = Reflex.getStatisInfo(list);
		//通过chartFactory 创建JFreeChart
		JFreeChart chart;
		try {
			chart = ChartFactory.createPieChart3D("动植物统计分析饼状图",  
					createPieDateSet(list1), true, false, false);
		} catch (UtilException e) {
			throw new UtilException("没有生成图片的数据");
		}  	
	
		
	    TextTitle textTitle = chart.getTitle();  
        textTitle.setFont(new Font("黑体",Font.BOLD,15));  
         
        PiePlot pieplot = (PiePlot) chart.getPlot();  
        pieplot.setLabelFont(new Font("宋体", 0, 12));  
         
        //没有数据的时候显示的内容   
        pieplot.setNoDataMessage("无数据显示");  
        pieplot.setCircular(false);  
        pieplot.setLabelGap(0.02D);  
         
        chart.getLegend().setItemFont(new Font("黑体",Font.BOLD,15));  
        return chart;
	}
	
	/**
	 * 得到生成图片的两个地址
	 * @param 
	 * 		list：CountSpecies对象
	 * @param 
	 * 		URL：项目的路径：req.getServletContext().getRealPath("");
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	public static List<String> getPieUrl(List list,String URL) throws UtilException {
		//文件输出流
		List<String> list1 = new ArrayList<String>();
		String temp = CreateFileURL.createSignURL();
		URL = CreateFileURL.createFile(URL+File.separator+"statistics"+File.separator+temp+File.separator);

		if(new CreatePic().savePie(list,URL)) {
			list1.add("statistics/"+temp+"/JXAPQPie.jpg");
		}
		if(new CreatePic().saveCate(list,URL)) {
			list1.add("statistics/"+temp+"/JXAPQCate.jpg");
		}
		return list1;
		
	}
	
	/**
	 * 得到两个图片以及要导出的统计的文件名
	 * @param 
	 * 		list:count对象
	 * @param 
	 * 		URL：项目的路径：req.getServletContext().getRealPath("");
	 * @param 
	 * 		temp：随机产生的文件夹名字
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	public static List<String> outputPie(List list,String URL,String temp) throws UtilException {
		//文件输出流
		List<String> list1 = new ArrayList<String>();
		if(new CreatePic().savePie(list,URL)) {
			list1.add("output"+File.separator+temp+File.separator+"JXAPQPie.jpg");
		}
		if(new CreatePic().saveCate(list,URL)) {
			list1.add("output"+File.separator+temp+File.separator+"JXAPQCate.jpg");
		}
		return list1;
		
	}
	
	/**
	 * 保存饼状图
	 * @param 
	 * 		list：CountSpecies对象
	 * @param 
	 * 		url：项目的路径：req.getServletContext().getRealPath("");
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	private boolean savePie(List list,String url) throws UtilException{
		new CreatePic().createPie(list);
		try {
			FileOutputStream os = new FileOutputStream(url+"JXAPQPie.jpg");
			ChartUtilities.writeChartAsPNG(os, new CreatePic().createPie(list), 450, 300);
		} catch (Exception e) {
			throw new UtilException("生成图片失败");
		}		//保存文件到指定目录下
		return true;
			
	}
	
	
	/**
	 * 保存柱状图
	 * @param 
	 * 		list：CountSpecies对象
	 * @param 
	 * 		url：项目的路径:req.getServletContext().getRealPath("");
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	private boolean saveCate(List list,String url) throws UtilException{
		new CreatePic().createChart(list);
		try {
			FileOutputStream os = new FileOutputStream(url+"JXAPQCate.jpg");
			ChartUtilities.writeChartAsPNG(os, new CreatePic().createChart(list), 450, 300);
		} catch (Exception e) {
			throw new UtilException("生成图片失败");
		}		//保存文件到指定目录下
		
		return true;
	}
}
