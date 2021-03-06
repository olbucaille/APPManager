package Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import Model.Media;
 
@WebServlet("/UploadDownloadFileServlet")
public class UploadDownloadFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload uploader = null;
    @Override
    public void init() throws ServletException{
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        if(fileName == null || fileName.equals("")){
            throw new ServletException("File Name can't be null or empty");
        }
        File file = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+fileName);
        if(!file.exists()){
            throw new ServletException("File doesn't exists on server.");
        }
        System.out.println("File location on server::"+file.getAbsolutePath());
        ServletContext ctx = getServletContext();
        InputStream fis = new FileInputStream(file);
        String mimeType = ctx.getMimeType(file.getAbsolutePath());
        response.setContentType(mimeType != null? mimeType:"application/octet-stream");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
         
        ServletOutputStream os       = response.getOutputStream();
        byte[] bufferData = new byte[1024];
        int read=0;
        while((read = fis.read(bufferData))!= -1){
            os.write(bufferData, 0, read);
        }
        os.flush();
        os.close();
        fis.close();
        System.out.println("File downloaded at client successfully");
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!ServletFileUpload.isMultipartContent(request)){
            throw new ServletException("Content type is not multipart/form-data");
        }
        String path=null;
        String fName=null;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.write("<html><head></head><body>");
        try {
            List<FileItem> fileItemsList = uploader.parseRequest(new ServletRequestContext(request));
            Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
            while(fileItemsIterator.hasNext()){
                FileItem fileItem = fileItemsIterator.next();
                System.out.println("FieldName="+fileItem.getFieldName());
                System.out.println("FileName="+fileItem.getName());
                System.out.println("ContentType="+fileItem.getContentType());
                System.out.println("Size in bytes="+fileItem.getSize());

                File file = new File((request).getServletContext().getAttribute("FILES_DIR")+File.separator+fileItem.getName());

                out.write("Absolute Path at server="+file.getAbsolutePath());
                path=file.getAbsolutePath();
                fName = fileItem.getName();
                fileItem.write(file);
                out.write("File "+fileItem.getName()+ " uploaded successfully.");
                
                out.write("<br>");
                out.write("<a href=\"UploadDownloadFileServlet?fileName="+fileItem.getName()+"\">Download "+fileItem.getName()+"</a>");
            }
        } catch (FileUploadException e) {
            out.write("Exception in uploading file1."+e);
        } catch (Exception e) {
            out.write("Exception in uploading file2."+e);
        }
        out.write("</body></html>");
        String idTeam= "1";//récupération de l'IDTeam pour stocker le fichier
        //enregistrement de l'url et du nom
        if(fName!=null && path!=null){
        	Media mediatemp =new Media("",fName, path);
            mediatemp.AddMediaOfTeam(mediatemp, idTeam);
        }
        
       //redirection(request,response,"http://localhost:8081/APPManager/SControllerStudentGroup");

       response.sendRedirect("/APPManager/SControllerStudentGroup");

    }
 
    

	//methode g�n�rique de redirection
	protected void redirection(HttpServletRequest request, HttpServletResponse response, String page) 
	{
		try{
			getServletContext().getRequestDispatcher(page).forward(request, response);
		}
		catch(ServletException e)
		{
			
		}
		catch(IOException e)
		{
			
		}
		
	}

}
