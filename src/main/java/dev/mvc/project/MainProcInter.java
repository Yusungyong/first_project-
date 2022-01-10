package dev.mvc.project;

import java.util.List;

public interface MainProcInter {
    /**
     * 
     * @param mainVO
     * @return
     */
    public int create(MainVO mainVO);

    
    // select id="total_list" resultType="dev.mvc.project.MainVO"  
    public List<MainVO> list();
    
    /**
     * 
     * @param main_no
     * @return List<MainVO> 
     */
    public MainVO read(int main_no);
    
    /**
     * 
     * @param mainVO
     * @return 처리 된 레코드 갯수 - cnt
     */
    public int update(MainVO mainVO);
    /**
     * 
     * @param main_no
     * @return
     */
    public int delete(int main_no);
    
    /**
     * 
     * @param main_no
     * @return
     */
    public int update_seqno_up(int main_no);
    /**
     * 
     * @param main_no
     * @return
     */
    public int update_seqno_down(int main_no);
    
    /**
     * 
     * @return
     */
    public List<MainVO> list_by_asc();
}
