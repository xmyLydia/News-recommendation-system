package com.News;

public class checkNews {
//���ڼ�������Ƿ��ǿ�
	public boolean qualified(String  content){
		boolean flag = false;
		if(content!=null &&content.length()!=0&&!content.equals("null")){
			flag = true;
		}
		return flag;
	}
}
