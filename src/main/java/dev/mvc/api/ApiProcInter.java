package dev.mvc.api;

import java.util.List;

public interface ApiProcInter {
    /**
     * 등록 폼
     * @param apiVO
     * @return
     */
    public int create(ApiVO apiVO);
    
    /**
     * api 전체 리스트
     * @param main_no 
     * @return
     */
    public List<ApiVO> list_api(int main_no);
    /**
     * 삭제처리
     * @param api_no
     * @return
     */
    public int delete(int api_no);

    /**
     * 읽기 폼
     * @param api_no
     * @return
     */
    public ApiVO read(int api_no);
    
    /**
     * 수정
     * @param apiVO
     * @return
     */
    public int update(ApiVO apiVO);
}
