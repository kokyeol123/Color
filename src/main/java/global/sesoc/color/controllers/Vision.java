package global.sesoc.color.controllers;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.ColorInfo;
import com.google.cloud.vision.v1.CropHint;
import com.google.cloud.vision.v1.CropHintsAnnotation;
import com.google.cloud.vision.v1.DominantColorsAnnotation;
import com.google.cloud.vision.v1.FaceAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
@Controller
public class Vision {
	
	@GetMapping("/index2")
	public String goindex() {
		return "jiha/index2";
	}
	//그 머냐 사진중에 가장 많은 색 찾는 기능
	@GetMapping("/colorFind")
	public String test(String filePath,Model model) {
	 List<AnnotateImageRequest> requests = new ArrayList<>();

     ByteString imgBytes = null;
	try {
		imgBytes = ByteString.readFrom(new FileInputStream(filePath));
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

     Image img = Image.newBuilder().setContent(imgBytes).build();
     Feature feat = Feature.newBuilder().setType(Type.IMAGE_PROPERTIES).build();
     AnnotateImageRequest request =
         AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
     requests.add(request);

     try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
       BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
       List<AnnotateImageResponse> responses = response.getResponsesList();

       for (AnnotateImageResponse res : responses) {
         if (res.hasError()) {
           System.out.printf("Error: %s\n", res.getError().getMessage());
           model.addAttribute("Error",res.getError().getMessage());
           return "result";
         }

        
         DominantColorsAnnotation colors = res.getImagePropertiesAnnotation().getDominantColors();
//         ColorInfo color = null;
         //픽셀 최대값 구해버리깃
         
         int count =0;
         float max=colors.getColorsList().get(0).getPixelFraction();
         for(int i=0;i<colors.getColorsList().size();i++) {
        	if(max <  colors.getColorsList().get(i).getPixelFraction()) {
        		max = colors.getColorsList().get(i).getPixelFraction();
        		count = i;
        	}
         }
        //가장넓은 면적의 색을 RGB로 표현
        System.out.println(colors.getColorsList().get(count).getColor().getRed()); 
         System.out.println(colors.getColorsList().get(count).getColor().getGreen());
         System.out.println(colors.getColorsList().get(count).getColor().getBlue());
         
         //rgb 값
         float red = colors.getColorsList().get(count).getColor().getRed();
         float green= colors.getColorsList().get(count).getColor().getGreen();
         float blue=colors.getColorsList().get(count).getColor().getBlue();
    
    		    
         
         model.addAttribute("red",red);
         model.addAttribute("green",green);
         model.addAttribute("blue",blue);
         return "result";

         //                  for (ColorInfo color : colors.getColorsList()) {
//        	
//              System.out.println(color.getPixelFraction());
//               System.out.println(color.getColor().getRed());
//               System.out.println (color.getColor().getGreen());
//               System.out.println (color.getColor().getBlue());
//               System.out.println(color.getScore());
//             
//              
//         }
       }
     } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "result";
     
   }
}