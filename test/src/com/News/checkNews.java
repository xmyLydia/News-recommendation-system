package com.News;

public class checkNews {
//用于检测新闻是否是空
	public boolean qualified(String  content){
		boolean flag = false;
		if(content!=null &&content.length()!=0&&!content.equals("null")){
			flag = true;
		}
		return flag;
	}
}
