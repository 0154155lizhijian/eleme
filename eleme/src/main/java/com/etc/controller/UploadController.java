package com.etc.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
		
	    @RequestMapping(value = "/upload", method = RequestMethod.POST)
	    public String upload(HttpServletRequest req, @RequestParam("file") MultipartFile file,Model m) {
	            try {
	                String fileName = System.currentTimeMillis()+file.getOriginalFilename();
	                String destFileName="D:\\test1\\"+file.getOriginalFilename();
	                System.out.println(destFileName);
	                 
	                File destFile = new File(destFileName);
	                destFile.getParentFile().mkdirs();
	                file.transferTo(destFile);
	                 
	                m.addAttribute("fileName",fileName);
	            } catch (FileNotFoundException e) {
	                e.printStackTrace();
	                return "上传失败," + e.getMessage();
	            } catch (IOException e) {
	                e.printStackTrace();
	                return "上传失败," + e.getMessage();
	            }
	             
	            return "../../uploadpage";
	    }   

}
