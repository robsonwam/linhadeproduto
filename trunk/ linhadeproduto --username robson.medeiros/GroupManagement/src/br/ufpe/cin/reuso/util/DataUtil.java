package br.ufpe.cin.reuso.util;

import java.sql.Date;
import java.util.Calendar;

final public class DataUtil {

	/*private static DataUtil dataUtil = null;
	
	public static DataUtil getInstance()
	{
		if (dataUtil == null)
		{
			dataUtil = new DataUtil();
		}
		return dataUtil;
	}
	
	private DataUtil() {
		super();
	}*/
	
	static public Date getDataAtual()
	{
		java.util.Date dataAtual = new java.util.Date();
		java.sql.Date dataSQL = new java.sql.Date(dataAtual.getTime());
		return dataSQL;
	}
	
	static public Date addDiaADataAtual(Integer dias){
		Date date = getDataAtual();
		Calendar calendar = Calendar.getInstance();  
		calendar.setTime(date); 
		calendar.add(Calendar.DAY_OF_MONTH, dias);
		System.out.println(dias);
		return new Date(calendar.getTime().getTime());
	}
	

}
