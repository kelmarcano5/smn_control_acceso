package domain.repgen.smn_registro.smn_personal;

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
				
		sheet.setColumnView(13, cellView);
		sheet.setColumnView(14, cellView);
		sheet.setColumnView(15, cellView);
		sheet.setColumnView(16, cellView);
		sheet.setColumnView(17, cellView);
		sheet.setColumnView(18, cellView);
		sheet.setColumnView(19, cellView);
		sheet.setColumnView(20, cellView);
		sheet.setColumnView(21, cellView);
		sheet.setColumnView(22, cellView);
		sheet.setColumnView(23, cellView);
		
	}	

}
