package domain.repgen.smn_acceso.smn_dispositivos;

import jxl.*;
import jxl.write.*;
import dinamica.*;
import dinamica.xml.Element;

/**
 * Genera un archivo excel con el contenido de un recordset,
 * se basa en una clase generica del framework. En general solo debe
 * implementar el metodo "createWorkbook".
 * <br><br>
 * Actualizado: 2007-05-29<br>
 * Framework Dinamica - Distribuido bajo licencia LGPL<br>
 * @author mcordova (martin.cordova@gmail.com)
 */

public class ExcelReportOutput extends GenericExcelOutput 
{

	@Override
	public void setColumns(Element[] cols, WritableSheet sheet,
			WritableCellFormat wcf, GenericTransaction data, int columnCount,
			int rowCount) throws Throwable {
		
		super.setColumns(cols, sheet, wcf, data, columnCount, rowCount);

		CellView cellView = new CellView();
		cellView.setHidden(true); //set hidden
				
		sheet.setColumnView(9, cellView);
		sheet.setColumnView(10, cellView);
		sheet.setColumnView(11, cellView);
		sheet.setColumnView(12, cellView);
		sheet.setColumnView(13, cellView);
		
	}	

}
