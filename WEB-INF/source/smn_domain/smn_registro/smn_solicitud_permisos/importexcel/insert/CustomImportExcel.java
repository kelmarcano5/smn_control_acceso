package smn_domain.smn_registro.smn_solicitud_permisos.importexcel.insert;

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
        String[] params = new String[] {
			"spe_causa",
			"spe_fecha_desde",
			"spe_detalles",
			"spe_jefe_inmediato_rf",
			"spe_documento_rf",
			"spe_cantidad_horas",
			"spe_estatus_rf",
			"spe_categoria_justif_rf",
			"spe_fecha_hasta"
		};
        return params;
     }
	 


}
