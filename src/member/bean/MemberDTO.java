package member.bean;

import lombok.Data;
//import lombok.Getter;
//import lombok.Setter;

//@Getter
//@Setter
@Data //전부 만들어줌
public class MemberDTO {
	private String name, id, pwd, gender, 
				   email1, email2, tel1, tel2, 
				   tel3, zipcode, addr1, addr2;

}