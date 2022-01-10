 package dev.mvc.project;

import java.util.List;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainCont {
    
    @Autowired
    @Qualifier("dev.mvc.project.MainProc")
    private MainProcInter MainProc;
    
    // http://localhost:9091/categrp/create.do
    /**
     * 등록 폼
     * @return
     */
    @RequestMapping(value="/cate_main/create.do", method=RequestMethod.GET )
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/cate_main/create"); // webapp/WEB-INF/views/main_cate/create.jsp
      
      return mav; // forward
    }
    
    // http://localhost:9091/categrp/create.do
    /**
     * 등록 처리
     * @return
     */
    
    @RequestMapping(value="/cate_main/create.do", method= RequestMethod.POST)
    public ModelAndView create(MainVO mainVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.MainProc.create(mainVO);
        System.out.println(cnt);
        mav.addObject("cnt", cnt);
        if (cnt == 1) {
//            System.out.println("등록 성공");
            mav.addObject("code", "create_success");
            mav.setViewName("redirect:/cate_main/list.do");
        }
        else {
            mav.addObject("code", "create_fail");
            mav.setViewName("/cate_main/msg.do");
        }
        return mav;
    }
    
    @RequestMapping(value="/cate_main/list.do", method=RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        List<MainVO> list = this.MainProc.list_by_asc();
        mav.addObject("list", list);
        
        mav.setViewName("/cate_main/list");
        return mav;
        
    }
    
    @RequestMapping(value="cate_main/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int main_no) {
        ModelAndView mav = new ModelAndView();
        
        MainVO mainVO = this.MainProc.read(main_no);
        mav.addObject("mainVO", mainVO);
        
        List<MainVO> list = this.MainProc.list();
        mav.addObject("list", list);
        
        mav.setViewName("/cate_main/read_update");
        
        return mav;
    }
    
    @RequestMapping(value="/cate_main/update.do", method = RequestMethod.POST)
    public ModelAndView update(MainVO mainVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.MainProc.update(mainVO);
        mav.addObject("cnt", cnt);
        if (cnt == 1) {
            mav.setViewName("redirect:/cate_main/list.do");
        }
        else {
            mav.addObject("code","update");
            mav.setViewName("/cate_main/msg");
        }
        
        
        return mav;
    }
    
    /**
     * 삭제 + 조회 폼
     * @param main_no
     * @return
     */
    @RequestMapping(value="/cate_main/read_delete.do", method=RequestMethod.GET)
    public ModelAndView read_delete(int main_no) {
        ModelAndView mav = new ModelAndView();
        MainVO mainVO = this.MainProc.read(main_no);
        List<MainVO> list = this.MainProc.list();
        
        mav.addObject("mainVO", mainVO);
        mav.addObject("list", list);
        
        mav.setViewName("/cate_main/read_delete");
        return mav;
        
    }
    @RequestMapping(value="/cate_main/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(int main_no) {
        ModelAndView mav = new ModelAndView();
        
        MainVO mainVO = this.MainProc.read(main_no);
        mav.addObject("mainVO", mainVO);
        int cnt = this.MainProc.delete(main_no);
        mav.addObject("cnt", cnt);
        if(cnt == 1) {
            mav.addObject("code", "delete_success");
        }
        else {
            mav.addObject("code", "delete_fail");
        }
        
        mav.setViewName("/cate_main/msg");
        return mav;
    }
    
    @RequestMapping(value="/cate_main/update_seqno_up.do", method=RequestMethod.GET)
    public ModelAndView update_seqno_up(int main_no) {
        ModelAndView mav = new ModelAndView();
        int cnt = this.MainProc.update_seqno_up(main_no);
        mav.addObject("cnt", cnt);
        
        mav.setViewName("redirect:/cate_main/list.do");
        
        return mav;
        
    }
    
    @RequestMapping(value="/cate_main/update_seqno_down.do", method=RequestMethod.GET)
    public ModelAndView update_seqno_down(int main_no) {
        ModelAndView mav = new ModelAndView();
        int cnt = this.MainProc.update_seqno_down(main_no);
        mav.addObject("cnt", cnt);
        
        mav.setViewName("redirect:/cate_main/list.do");
        
        return mav;
        
    }


}
