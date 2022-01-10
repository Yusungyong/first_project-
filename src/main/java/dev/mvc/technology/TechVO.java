package dev.mvc.technology;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;
/*
 * CREATE TABLE technology (
    techno          NUMBER(4)       NOT NULL    PRIMARY KEY,
    adminno         NUMBER(4)       NOT NULL,
    api_no          NUMBER(4)       NOT NULL,
    tech_name       VARCHAR(30)     NOT NULL,
    contents        CLOB            NOT NULL,
    cnt             NUMBER(4)       DEFAULT 0     NULL,
    reply           VARCHAR(100)    NULL,
    rdate           DATE            NOT NULL,
    word            VARCHAR(100)    NULL,
    thumb1          VARCHAR(100)    NULL,
    size1           NUMBER(10)      NULL,
    passwd      VARCHAR(16)     NOT NULL
    
        FOREIGN KEY (adminno) REFERENCES admin (adminno),
        FOREIGN KEY (api_no) REFERENCES api (api_no)        
);
 */


@Getter @Setter @ToString
public class TechVO {
    /** 기술 레코드 번호 */
    private int techno;
    /** 회원 번호 */
    private int adminno;
    /** api 번호  */
    private int api_no;
    /** 기술 이름 */
    private String tech_name;
    /** 기술 내용 */
    private String contents;
    /** 조회수 */
    private int cnt;
    /** 댓글 */
    private String reply;
    /** 업로드 날짜 */
    private String rdate;
    /** 검색어 */
    private String word;
    /** 파일 */
    private String file1;
    /** 파일 저장 */
    private String file1saved;
    /** 파일 썸네일 */
    private String thumb1;
    /** 파일 사이즈 */
    private long size1;
    /** 패스워드 */
    private String passwd;
    /** 추천 수 */
    private int recom;
    
    
    /** 
    이미지 MultipartFile 
    <input type='file' class="form-control" name='file1MF' id='file1MF' 
                     value='' placeholder="파일 선택">
    */
    private MultipartFile file1MF;
    /**
     * 파일 크기 단위 출력
     */
    private String size1_label;
}





