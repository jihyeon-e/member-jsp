package board.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int seq, ref, lev, step, pseq, reply, hit;
	private String id, name, email, subject, content;
	private Date logtime; //Data형이기때문에 BoardDAO에서 to_char()안해도 YYYY-MM-DD로 나옴
						  //만약 String이었으면 시,분,초 전부 나옴
}