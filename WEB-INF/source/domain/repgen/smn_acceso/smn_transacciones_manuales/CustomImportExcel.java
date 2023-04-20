package domain.repgen.smn_acceso.smn_transacciones_manuales;

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
        String[] params = new String[] {"trm_sede",
        		                        "trm_dispositivo",
        		                        "trm_identificacion",
        		                        "trm_marcaje",
        		                        "trm_tipo_marcaje_ref",
        		                        "trm_fecha_transaccion",
        		                        "trm_hora_transaccion",
        		                        "trm_jutificacion"};
        return params;
     }
	 


}
