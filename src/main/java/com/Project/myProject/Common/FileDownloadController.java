package com.Project.myProject.Common;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH ="C:\\SpringWorkSpace\\uploadFile";

	/* @RequestMapping("/download") */
	protected void download(@RequestParam("imageFileName") String imageFileName,HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		//attachment 는 헤더파일 이름을 설정하는 코드이다.
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		
		//buffer 를 이용해 한번에 8Kbyte씩 브라우저로 전송하는 while문
		while(true) {
		int count = in.read(buffer);
		if(count == -1) break;
		out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
}
