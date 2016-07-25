package com.jxapq.servlet.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/*
 * MD5 算法
*/
public class MD5 {
	
    private String str;//字符串
    public MD5(String str) {
    	this.str=str;
    }
    
    // 全局数组
    private final static String[] strDigits = 
    	{ "0", "1", "2", "3", "4", "5","6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

    // 返回形式为数字跟字符串
	private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }

    // 返回形式只为数字
    @SuppressWarnings("unused")
	private static String byteToNum(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        return String.valueOf(iRet);
    }

    // 转换字节数组为16进制字串
    private static String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
        	//控制返回形式是数字还是数字跟字符串
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }
    //获取传入的字符串和加密方式
    public String GetMD5Code() {
        String result = null;
        try {
            result = new String(this.str);
            //加密方式，此处我们用md5,改成SHA1则换掉加密方式
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(this.str.getBytes());
            result = byteToString(bytes);
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    
    
	public static void main(String[] args) {
		String scr = "~`!@#$%^&*()123890abcmNXYZ_+-=*/.'\\\",'";
		System.out.println("-----------------MD5---------------");
		
		MD5 getMD5 = new MD5(scr);
		String md5 = getMD5.GetMD5Code();
		
		System.out.print("字符串:");
		System.err.println(scr);
		System.out.println("MD5 16位 小写:"+md5.substring(8, md5.length()-8));
		System.out.println("MD5 16位 大写:"+md5.substring(8, md5.length()-8).toUpperCase());
		System.out.println("MD5 32位 小写:"+md5);
		System.out.println("MD5 32位 大写:"+md5.toUpperCase());
	}
}