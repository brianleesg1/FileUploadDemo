package sg.com.ncs.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    Logger log = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/")
    public String home() {
        log.info("HomeController 123: Passing through...");
     
        return "WEB-INF/views/home.jsp";
    }

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadFile(UploadItem uploadItem, BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
   
		log.info("uploadFile");


		if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                    log.error("Error: " + error.getCode() + " - " + error.getDefaultMessage());
            }
            throw new RuntimeException("Error in uploadFile");
		}

		MultipartFile file = uploadItem.getFile();
        log.info("file name = " + file.getName());
        log.info("file (original name) = " + file.getOriginalFilename());
        log.info("file size = " + file.getSize());
        log.info("file content type = " + file.getContentType());
        log.info("chunk = " + uploadItem.getChunk());
        log.info("chunks = " + uploadItem.getChunks());
		return "WEB-INF/views/home.jsp";

	}
	
}
