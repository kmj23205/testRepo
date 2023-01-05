package ez.web.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data// getter(), setter90, toString() .. 자동완성
//@Setter @Getter
//@NoArgsConstructor
//@AllArgsConstructor
public class ReplyDTO {
	private int rno;
	private int bid;
	
	private String r_contents;
	private String replyer;
	private Date r_date;
	private Date update_date;
}
