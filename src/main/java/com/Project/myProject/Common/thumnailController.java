package com.Project.myProject.Common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class thumnailController {
	private static String CURR_IMAGE_REPO_PATH ="C:\\SpringWorkSpace\\uploadFile";
	@RequestMapping("/download")
	protected void download(@RequestParam("imageFileName") String imageFileName,
	HttpServletResponse response) throws Exception{
	OutputStream out = response.getOutputStream();
	String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
	File image = new File(filePath);
	int lastIndex = imageFileName.lastIndexOf("."); //확장자에서 제외한 원본 이미지 파일의 이름을 가져옵니다.
	String fileName = imageFileName.substring(0,lastIndex);
	File thumnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "thumnail" + "\\" + fileName+".png");
	if(image.exists()) {
		thumnail.getParentFile().mkdirs();
		Thumbnails.of(image).size(50, 50).outputFormat("png").toFile(thumnail);
	}
	
	FileInputStream in = new FileInputStream(thumnail);
	byte[] buffer =new byte[1024 * 8];
	while (true) {
		int count = in.read(buffer);
		if(count==-1) break;
		out.write(buffer,0,count);
	}
	in.close();
	out.close();
	}
}
