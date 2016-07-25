package com.jxapq.servlet.util;


import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import com.jxaoq.util.email.Mail;
import com.jxaoq.util.email.MailUtils;

public class EmailUtil {
	private String name;//用户名
	private String to;//收件人
	private String code;//验证码
	public EmailUtil(String name,String to,String code){
		this.name = name;
		this.to = to;
		this.code = code;
	}
	public boolean send(int type){
		InputStream is = EmailUtil.class.getResourceAsStream(
				"/com/jxapq/service/properties/EmailUtil.properties");
		Properties props = new Properties();
		try {
			props.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String smtp = props.getProperty("smtp");//获取服务器主机
		String username = props.getProperty("username");//获取用户名
		String password = props.getProperty("password");//获取密码
		String from = props.getProperty("from");//获取发件人
		String name = this.name;
		String to = this.to;//收件人
		String code = this.code;//验证码
		String subject = props.getProperty("subject");//获取主题
		String content = null;
		if(type==0){//发送激活链接
			content = props.getProperty("contentLink");//获取邮件内容
			content = MessageFormat.format(content,name,name,code);//替换{0,1,2}
		}else if(type==1){//发送验证码
			content = props.getProperty("contentCode");//获取邮件内容
			content = MessageFormat.format(content,name,code);//替换{0,1}
		}
		try {
			Session session = MailUtils.createSession(smtp, username, password);//得到session
			Mail mail = new Mail(from, to,subject,content);//创建邮件对象
			MailUtils.send(session, mail);
System.out.println(content+"\n发送成功");
		return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static void main(String[] args) throws Exception {
		for(int i=0;i<10000000;i++){
		}
		EmailUtil email = new EmailUtil("xym","438443117@qq.com","123456789");
		email.send(0);//发送激活链接
		email.send(1);//发送验证码
	}

}
