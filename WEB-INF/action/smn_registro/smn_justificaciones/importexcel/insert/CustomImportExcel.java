package smn_domain.smn_registro.smn_justificaciones.importexcel.insert;

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
			jus_causa,
jus_fecha_incidencia,
jus_descripcion,
jus_jefe_inmediato_rf,
jus_tipo_actividad_rf,
jus_tiempo_a_justificar,
jus_estatus_rf,
jus_documento_rf,
jus_hora_incidencia
		};
        return params;
     }
	 


}
