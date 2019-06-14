package com.Project.myProject.Common;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
public class Fileupload {
private static String CURR_IMAGE_REPO_PATH ="C:\\Users\\김기문\\git\\PJT\\src\\main\\webapp\\WEB-INF\\uploadImage";

public List<String> Filename(MultipartHttpServletRequest multipartRequest){
	Iterator<String> fileNames = multipartRequest.getFileNames();
	while(fileNames.hasNext()) {
		String fileName = fileNames.next();
		MultipartFile mFile = multipartRequest.getFile(fileName);
		String originalFileName =mFile.getOriginalFilename();
}
	return new ArrayList<String>();
}



public List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
List<String> fileList = new ArrayList<String>();
Iterator<String> fileNames = multipartRequest.getFileNames();
while(fileNames.hasNext()) {
String fileName = fileNames.next();
MultipartFile mFile = multipartRequest.getFile(fileName);
String originalFileName = mFile.getOriginalFilename(); // 실제 파일 이름을 가져온다.
fileList.add(originalFileName);
File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
if(mFile.getSize() !=0) {
if(! file.exists()) {
if(file.getParentFile().mkdirs()) {
file.createNewFile();
}
}
mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
}
}
return fileList;
}
}