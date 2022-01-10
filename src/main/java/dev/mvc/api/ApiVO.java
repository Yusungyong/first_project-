package dev.mvc.api;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * 
CREATE TABLE lang(
       lang_no      NUMBER(4)      NOT NULL     PRIMARY KEY,
       main_no      NUMBER(4)      NULL,
       lang_name    VARCHAR(30)    NOT NULL,
       position     VARCHAR(50)    NOT NULL,
       rdate        DATE           NOT NULL,
    FOREIGN KEY (main_no) REFERENCES maincate(main_no)
);
 */
@Getter @Setter @ToString
public class ApiVO {
    /** 카테고리 그룹 번호 */
    private int main_no;
    /** 카테고리 이름 */
    private int api_no;
    /** 등록 순서 */
    private String api_name;
    /** 출력 순서 */
    private int api_seqno;
    /** api 포지션 */
    private String position;
    /** 등록일 */
    private String rdate;

}
