package global.sesoc.color.controllers;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.color.util.FileService;



@RestController
public class AjaxController {
	
	
	final String uploadPath="/Users/yoonjiha/Desktop/uploadPath";
	@PostMapping("/upload")
	public void upload(MultipartFile upload) {
		//새로 저장하면 그전 파일 삭제 할수 있게 기능 추가하기
		FileService.saveFile(upload, uploadPath);
		System.out.println(upload.getOriginalFilename());
		
	}
	
}
