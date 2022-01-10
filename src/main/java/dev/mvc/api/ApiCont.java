package dev.mvc.api;


import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.project.MainProcInter;
import dev.mvc.project.MainVO;
import dev.mvc.api.ApiProcInter;

@Controller
public class ApiCont {

    @Autowired
    @Qualifier("dev.mvc.api.ApiProc")
    private ApiProcInter apiProc;
    
    @Autowired
    @Qualifier("dev.mvc.project.MainProc")
    private MainProcInter mainProc;
    
    /**
     * 등록 폼
     * http://localhost:9091/api/create_api.do
     * @param apiVO
     * @return
     */
    @RequestMapping(value="/api/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("/api/create");
        return mav;
    }
    
    @RequestMapping(value="/api/create.do", method = RequestMethod.POST)
    public ModelAndView create(ApiVO apiVO) {
       ModelAndView mav= new ModelAndView();
       
       int cnt = this.apiProc.create(apiVO);
       
       mav.addObject("code", "create_success");
       mav.addObject("cnt", cnt);
       mav.addObject("main_no", apiVO.getMain_no());
       mav.addObject("api_name",apiVO.getApi_name());
       mav.addObject("url", "/api/msg");
       mav.setViewName("redirect:/api/list_api.do");
        return mav; 
    }
    
    /**
     * 카테고리 그룹별 전체 목록
     * http://localhost:9091/api/list_api.do
     * @return
     */
    @RequestMapping(value="/api/list_api.do", method=RequestMethod.GET )
    public ModelAndView list_by_api(int main_no) {
      ModelAndView mav = new ModelAndView();
      
      List<ApiVO> list = this.apiProc.list_api(main_no);
      mav.addObject("list", list); // request.setAttribute("list", list);

      MainVO  mainVO = mainProc.read(main_no); // 카테고리 그룹 정보
      mav.addObject("mainVO", mainVO); 
      
      mav.setViewName("/api/list_api"); // /cate/list_by_categrpno.jsp
      return mav;
    }
    
    /**
     * 삭제 폼 생성
     * @param api_no
     * @return
     */
    @RequestMapping(value="/api/read_delete.do", method=RequestMethod.GET)
   public ModelAndView read_delete(int api_no) {
       ModelAndView mav = new ModelAndView();
       ApiVO apiVO = this.apiProc.read(api_no);
       mav.addObject("apiVO", apiVO);
       
       int main_no = apiVO.getMain_no();
       MainVO mainVO = this.mainProc.read(main_no);
       mav.addObject("mainVO", mainVO);

       List<ApiVO> list = this.apiProc.list_api(main_no);
       mav.addObject("list", list);

       return mav;
   }
    
    @RequestMapping(value="/api/delete.do", method=RequestMethod.POST)
   public ModelAndView delete(int api_no) {
       ModelAndView mav = new ModelAndView();
       
       ApiVO apiVO = this.apiProc.read(api_no);
       int cnt = this.apiProc.delete(api_no);
       mav.addObject("cnt", cnt);
 
           mav.addObject("code", "delete_success");
           mav.addObject("api_no", api_no);
           mav.addObject("main_no", apiVO.getMain_no());
           mav.addObject("api_name",apiVO.getApi_name());
           mav.addObject("url", "/api/msg");
           mav.addObject("code", "delete_fail");
       
       mav.setViewName("redirect:/api/list_api.do");
       
       return mav;  
   }
    
    @RequestMapping(value="/api/read_update.do", method=RequestMethod.GET)
   public ModelAndView read_update(int api_no, int main_no) {
       ModelAndView mav = new ModelAndView();
       ApiVO apiVO = this.apiProc.read(api_no);
       MainVO mainVO = this.mainProc.read(main_no);
       List<ApiVO> list = this.apiProc.list_api(main_no);

       mav.addObject("apiVO", apiVO);
       mav.addObject("mainVO", mainVO);
       mav.addObject("list", list);
       mav.setViewName("/api/read_update");
       
       
       
       return mav;  
   }
    @RequestMapping(value="/api/update.do", method=RequestMethod.POST)
    public ModelAndView update(ApiVO apiVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.apiProc.update(apiVO);

        if (cnt == 1) {
            mav.addObject("main_no", apiVO.getMain_no());
        }else {
            mav.addObject("code", "update_fail");
            mav.addObject("cnt", cnt);
            mav.addObject("api_no", apiVO.getApi_no());
            mav.addObject("main_no", apiVO.getMain_no());
            mav.addObject("api_name", apiVO.getApi_name());
            mav.addObject("url", "/api/msg");
        }
        mav.setViewName("redirect:/api/list_api.do");
        
        return mav;
    }
        

}
