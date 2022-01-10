package dev.mvc.project;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;



@Component("dev.mvc.project.MainProc")
public class MainProc implements MainProcInter {
    
    @Autowired
    private MainDAOInter MainDAO;

    @Override
    public int create(MainVO mainVO) {
        int cnt = MainDAO.create(mainVO);
        return cnt;
    }
    
    @Override
    public List<MainVO> list() {
        List<MainVO> list = this.MainDAO.list();
        return list;
    }

    @Override
    public MainVO read(int main_no) {
        MainVO mainVO = this.MainDAO.read(main_no);
        return mainVO;
    }

    @Override
    public int update(MainVO mainVO) {
        int cnt = this.MainDAO.update(mainVO);
        return cnt;
    }

    @Override
    public int delete(int main_no) {
        int cnt = this.MainDAO.delete(main_no);
        return cnt;
    }

    @Override
    public int update_seqno_up(int main_no) {
        int cnt = this.MainDAO.update_seqno_up(main_no);
        return cnt;
    }

    @Override
    public int update_seqno_down(int main_no) {
        int cnt = this.MainDAO.update_seqno_down(main_no);
        return cnt;
    }

    @Override
    public List<MainVO> list_by_asc() {
        List<MainVO> list = this.MainDAO.list_by_asc();
        return list;
    }
    
    



}
