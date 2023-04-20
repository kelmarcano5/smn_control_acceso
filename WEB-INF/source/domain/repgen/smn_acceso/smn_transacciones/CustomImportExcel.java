package domain.repgen.smn_acceso.smn_transacciones;

import dinamica.ImportExcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class CustomImportExcel extends ImportExcel
{	
	@Override
	public InputStream getInputStream(File file) throws Throwable 
	{

		InputStream f = new FileInputStream(file); 
		InputStream xls = new domain.convert.ExcelConvertHelper().convertFromXLSXtoXLS(f);
		
		return xls;
	}
	
	 @Override
     public String[] getParamsNames() throws Throwable 
	 {
        String[] params = new String[] {"trn_dispositivo",
        		                        "trn_identificacion",
        		                        "trn_fecha_transaccion",
        		                        "trn_hora_transaccion"};
        return params;
     }
	 


}
