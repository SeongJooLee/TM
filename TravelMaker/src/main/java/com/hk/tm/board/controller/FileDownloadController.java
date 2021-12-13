package com.hk.tm.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\files";
	
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String image = request.getParameter("image");
		String noticeNO = request.getParameter("noticeNO");
		String name = request.getParameter("name");
		System.out.println("내가 원하는거 image = ["+image+"]");
		System.out.println("noticeNO = ["+noticeNO+"]");
		System.out.println("name = ["+name+"]");

		OutputStream out = response.getOutputStream();
		String path = CURR_IMAGE_REPO_PATH+"\\"+name+"\\"+noticeNO+"\\"+image;
		File imageFile = new File(path);

		int lastIndex = image.lastIndexOf(".");
		String fileName = image.substring(0,lastIndex);
		File thumbnail = new File(CURR_IMAGE_REPO_PATH+"\\"+"thumbnail"+"\\"+fileName+".png");
		
		if(imageFile.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(50, 50).outputFormat("png").toFile(thumbnail);
		}
		
		FileInputStream in = new FileInputStream(imageFile);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
