package smn_domain.smn_registro.smn_personal.importexcel.excel.template;

import jxl.*;
import jxl.write.*;
import dinamica.*;
import dinamica.xml.Element;

/**
 * Genera un archivo excel con el contenido de un recordset,
 * se basa en una clase generica del framework. En general solo debe
 * implementar el metodo "createWorkbook".
 * <br><br>
 * Actualizado: 02-12-2016<br>
 * @author Juan Carlos Eduardo Hidalgo
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
				
		/** sheet.setColumnView(valor, cellView); **/
		sheet.setColumnView(16, cellView);
		sheet.setColumnView(17, cellView);
		sheet.setColumnView(18, cellView);
		sheet.setColumnView(19, cellView);
		sheet.setColumnView(20, cellView);
		sheet.setColumnView(21, cellView);
		sheet.setColumnView(22, cellView);
		sheet.setColumnView(23, cellView);
		sheet.setColumnView(24, cellView);
		sheet.setColumnView(25, cellView);
		sheet.setColumnView(26, cellView);
		sheet.setColumnView(27, cellView);
		sheet.setColumnView(28, cellView);
	}	

}
