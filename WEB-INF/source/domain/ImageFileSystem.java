package domain;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

import dinamica.GenericTableManager;
import dinamica.Recordset;

public class ImageFileSystem extends GenericTableManager{
	
	public int service(Recordset inputParams) throws Throwable
	{
	        //obtener ruta y archivo temporal
	        String temp = inputParams.getString("_tempfile");
	        File f = new File( temp );
	        String name = f.getName();
	        name = name.substring(0, name.indexOf("."));
	        name = name + ".jpg";

	        //obtener ruta de destino
	        String path = getConfig().getConfigValue("folder");
	        File d = new File( path + java.io.File.separator + name);

	        //copiar archivo al directorio de destino
	        copyFileUsingChannel(f,d);

	        //colocar el nombre del archivo temporal en el recordset del request
	        inputParams.setValue("_filenametemp", name);

	        //eliminar archivo
	        f.delete();

	        return super.service(inputParams);

	}
	
	@SuppressWarnings("resource")
	public void copyFileUsingChannel(File source, File dest) throws IOException {
	    FileChannel sourceChannel = null;
	    FileChannel destChannel = null;
	    try {
	        sourceChannel = new FileInputStream(source).getChannel();
	        destChannel = new FileOutputStream(dest).getChannel();
	        destChannel.transferFrom(sourceChannel, 0, sourceChannel.size());
	       }finally{
	           sourceChannel.close();
	           destChannel.close();
	   }
	}

}
