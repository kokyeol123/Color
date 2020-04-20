package global.sesoc.color.vo;

import lombok.Data;

@Data
public class Review {
	
	private int reviewno;
	private String content;
	private String writer;
	private String writedate;
	private String originalfile;
	private String savedfile;
	private int reviewgrade;
	private String skintype;
	private String profilephoto;
	private String age;
	private String gender;
}
