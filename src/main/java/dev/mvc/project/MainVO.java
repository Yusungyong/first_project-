package dev.mvc.project;

import lombok.Getter;

import lombok.Setter;
import lombok.ToString;

/*
 * CREATE TABLE maincate(
 * 
                        main_no   NUMBER(4)   NOT NULL PRIMARY KEY,
                        main_name      VARCHAR(20) NOT NULL,
                        main_seqno NUMBER(4) NOT NULL,
                        rdate       DATE        NOT NULL
);
 */

@Getter @Setter @ToString
public class MainVO {
    /** 카테고리 그룹 번호 */
    private int main_no;
    /** 카테고리 이름 */
    private String main_name;
    /** 등록 순서 */
    private int main_seqno;
    /** 등록일 */
    private String rdate;

}
