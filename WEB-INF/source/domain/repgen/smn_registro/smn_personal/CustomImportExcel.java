package domain.repgen.smn_registro.smn_personal;

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
        String[] params = new String[] {"psl_num_control",
        		                        "psl_clase_auxiliar_ref",
        		                        "psl_auxiliar_ref",
        		                        "psl_empresa_ref",
        		                        "psl_sucursal_ref",
        		                        "psl_area_servicio_ref",
        		                        "psl_unidad_servicio_ref",
        		                        "psl_centro_costo_ref",
        		                        "psl_estructura_organiz_ref",
        		                        "psl_cargo_ref",
        		                        "psl_categoria_cargo_ref",
        		                        "psl_habilita_acceso_ref",
        		                        "psl_id_control_acceso"};
        return params;
     }
	 


}
