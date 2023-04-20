package smn_domain.smn_registro.smn_personal.importexcel.insert;

//import dinamica.ImportExcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class CustomImportExcel extends smn_domain.smn_registro.smn_personal.importexcel.insert.ImportExcel
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
    		"psl_num_control",
			"psl_esquema_rotacion_rf_ref",
			"psl_fecha_inicio_calculo",
			"psl_categoria_personal_rf_ref",
			"psl_clase_auxiliar_rf_ref",
			"psl_auxiliar_rf_ref",
			"psl_empresa_rf_ref",
			"psl_sucursal_rf_ref",
			"psl_area_servicio_rf_ref",
			"psl_unidad_servicio_rf_ref",
			"psl_centro_costo_rf_ref",
			"psl_estructura_organizacional_rf_ref",
			"psl_cargo_rf_ref",
			"psl_categoria_cargo_rf_ref",
			"psl_habilita_acceso_rf_ref",
			"psl_id_control_acceso"
		};
        return params;
     }
	 


}
