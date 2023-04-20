package smn_domain.smn_registro.smn_justificaciones.importexcel.excel;

import jxl.write.Label;
import jxl.write.WritableImage;
import jxl.write.WritableSheet;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

import javax.imageio.ImageIO;

import dinamica.GenericExcelOutput;
import dinamica.GenericTransaction;

public class ExcelReportOutput extends GenericExcelOutput 
{

	protected WritableSheet beforeData (WritableSheet sheet, GenericTransaction data, int countReg) throws Throwable 
	{

		//obtener referencia a config.xml
		dinamica.xml.Document docXML = getConfig().getDocument();

		//obtener elemento del logo
		dinamica.xml.Element logo = docXML.getElement("excel-logo");
		if (logo == null)
		{
			throw new Throwable("Element <excel-logo> not found in config.xml file - It is required in the definition.");
		}
		
		String logoPath = logo.getAttribute("url");
		
		//obtener elemento title
		dinamica.xml.Element elementoTitle = docXML.getElement("title");
		if (elementoTitle == null)
		{
			throw new Throwable("Element <title> not found in config.xml file - It is required in the definition.");
		}

		String titleExcel = elementoTitle.getAttribute("name");
		int cellExcelX = Integer.parseInt(elementoTitle.getAttribute("cellPosX"));
		int cellExcelY = Integer.parseInt(elementoTitle.getAttribute("cellPosY"));
		int cellStep  = Integer.parseInt(elementoTitle.getAttribute("cellStep"));

		BufferedImage input = ImageIO.read(getContext().getResource(logoPath));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(input, "PNG", baos);

		float imgX = 0;
		float imgY = 0;

		sheet.addImage(
				new WritableImage(
						imgX + cellStep,
						imgY,
						2,
						2,
						baos.toByteArray()
						)
				);

		Label label = new Label( 0, 0, "" ); 
		sheet.addCell(label);

		label = new Label( 0, 1, "" ); 
		sheet.addCell(label);
				
		label = new Label( cellExcelX, cellExcelY+1, titleExcel ); 
		sheet.addCell(label);
		
		label = new Label( 0, 2, "" ); 
		sheet.addCell(label);

		return sheet;
	}

}
