package library;

import javax.servlet.http.Part;

public class GetFileName {
	public static String getFileName(final Part filePart){
		final String  path_content = filePart.getHeader("content-disposition");
	    String[] arrContent = path_content.split(";");
	    String filename = "";
	    for (String icontent : arrContent) {
			if(icontent.trim().startsWith("filename")){
				filename = icontent;
			}
		}
	    filename = filename.replace("\"", "").replace("filename=", "");
	    return filename.trim();
	}
}
