package imageboard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ImageboardDTO {
	private int seq, imagePrice, imageQty;
	private String imageId, imageName, imageContent, image1;
	private Date logtime;
}
