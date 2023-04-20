package domain.repgen.smn_acceso.smn_dispositivos;

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
        String[] params = new String[] {"dis_codigo",
        		                        "dis_nombre",
        		                        "dis_empresa_ref",
        		                        "dis_sucursal_ref",
        		                        "dis_area_servicio_ref",
        		                        "dis_unidad_servicio_ref",
        		                        "dis_tipo_dispositivo_ref",
        		                        "dis_serial",
        		                        "dis_ip_address"};
        return params;
     }
	 


}
