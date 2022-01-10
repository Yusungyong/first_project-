package dev.mvc.technology;

import java.util.HashMap;
import java.util.List;

public interface TechDAOInter {

    /**
     * 
     * @param techno
     * @return
     */
    public List<TechVO> list_technology_grid(int techno);
    
    /**
     * 등록 폼
     * @param techVO
     * @return
     */
    public int create(TechVO techVO);
    
    /**
     * 조회
     * @param techno
     * @return
     */
    
    public TechVO read(int techno);
    
    /**
     * 패스워드 체크
     * @param hashMap
     * @return
     */
    public int passwd_check(HashMap<String, Object> map);
    
    /**
     * 수정 폼
     * @param techVO
     * @return
     */
    public TechVO read_update_text(int techno);
    
    /**
     * 수정 처리
     * @param techVO
     * @return
     */
    public int update_text(TechVO techVO);
    
    /**
     * 파일 수정
     * @param techVO
     * @return
     */
    public int update_file(TechVO techVO);
    
    /**
     * 삭제
     * @param techno
     * @return
     */
    public int delete(int techno);
    
    /**
     * 카테고리별 검색 레코드 갯수
     * @param hashMap
     * @return
     */
    public int search_count(HashMap<String, Object> hashMap);
    
    /**
     * 검색 + 페이징 목록
     * @param map
     * @return
     */
    public List<TechVO> list_technology(HashMap<String, Object> map);
    
    /**
     * 추천 수 증가
     * @param techno
     * @return
     */
    
}
