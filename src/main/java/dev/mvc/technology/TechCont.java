package dev.mvc.technology;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.api.ApiProcInter;
import dev.mvc.api.ApiVO;
import dev.mvc.project.MainProcInter;
import dev.mvc.project.MainVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class TechCont {
    @Autowired
    @Qualifier("dev.mvc.technology.TechProc")
    private TechProcInter techProc;
    @Autowired
    @Qualifier("dev.mvc.api.ApiProc")
    private ApiProcInter apiProc;
    @Autowired
    @Qualifier("dev.mvc.project.MainProc")
    private MainProcInter mainProc;
    private String uploadDir = Technology.getPath();
    public TechCont() {
        System.out.println("Tech Cont 실행 됨");
    }
    
    
    @RequestMapping(value="/technology/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();

      mav.setViewName(url); // forward
      
      return mav; // forward
    }

    /**
     * 등록 폼 생성
     * 
     * @param api_no
     * @return
     */
    @RequestMapping(value = "/technology/create.do", method = RequestMethod.GET)
    public ModelAndView create(int api_no) {
        ModelAndView mav = new ModelAndView();

        ApiVO apiVO = this.apiProc.read(api_no);
        MainVO mainVO = this.mainProc.read(apiVO.getMain_no());

        mav.addObject("apiVO", apiVO);
        mav.addObject("mainVO", mainVO);

        mav.setViewName("/technology/create");

        return mav;
    }
    
    
    /**
     * 등록 처리
     * @param request
     * @param techVO
     * @return
     */
    @RequestMapping(value="/technology/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, TechVO techVO) {
        ModelAndView mav = new ModelAndView();

        // 파일 전송코드
        String file1 = ""; // 원본 파일명 image
        String file1saved = ""; // 저장된 파일명, image
        String thumb1 = ""; // preview image
        String uploadDir = this.uploadDir;
        // 기준경로 확인

        MultipartFile mf = techVO.getFile1MF();

        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출

        long size1 = mf.getSize(); // 파일크기

        if (size1 > 0) {
            file1saved = Upload.saveFileSpring(mf, uploadDir);
            if (Tool.isImage(file1saved)) {
                thumb1 = Tool.preview(uploadDir, file1saved, 200, 150);
            }
        }
        techVO.setFile1(file1);
        techVO.setFile1saved(file1saved);
        techVO.setThumb1(thumb1);
        techVO.setSize1(size1);

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.techProc.create(techVO);
        // ------------------------------------------------------------------------------
        // PK의 return
        // ------------------------------------------------------------------------------
        System.out.println("--> techno: " + techVO.getTechno());
        System.out.println("--> techno: " + techVO.getThumb1());
        mav.addObject("techno", techVO.getTechno());
        
        if( cnt == 1) {
            mav.addObject("code", "create_success");

            
        } else {
            mav.addObject("code", "create_fail");
        }
        mav.addObject("cnt", cnt);
        mav.addObject("api_no", techVO.getApi_no());
        mav.addObject("url", "/technology/msg");
        mav.setViewName("redirect:/technology/msg.do");
        return mav;
    }

//    @RequestMapping(value = "/technology/list_technology.do", method = RequestMethod.GET)
//    public ModelAndView list_technology(int api_no) {
//        ModelAndView mav = new ModelAndView();
//
//        List<TechVO> list = this.techProc.list_technology_grid(api_no);
//        ApiVO apiVO = this.apiProc.read(api_no);
//
//        MainVO mainVO = this.mainProc.read(apiVO.getMain_no());
//        mav.addObject("list", list);
//        mav.addObject("apiVO", apiVO);
//        mav.addObject("mainVO", mainVO);
//
//        mav.setViewName("/technology/list_technology");
//
//        return mav;
//    }

    @RequestMapping(value = "/technology/read.do", method = RequestMethod.GET)
    public ModelAndView read(int techno) {
        ModelAndView mav = new ModelAndView();

        TechVO techVO = this.techProc.read(techno);
        mav.addObject("techVO", techVO);
        ApiVO apiVO = this.apiProc.read(techVO.getApi_no());
        mav.addObject("apiVO", apiVO);
        MainVO mainVO = this.mainProc.read(apiVO.getMain_no());
        mav.addObject("mainVO", mainVO);

        mav.setViewName("/technology/read");

        return mav;
    }    
    
    /**
     * 수정 폼
     * @param techno
     * @return
     */
    @RequestMapping(value="/technology/update_text.do", method = RequestMethod.GET)
    public ModelAndView update_text(int techno) {
        ModelAndView mav = new ModelAndView();
        
        TechVO techVO = this.techProc.read_update_text(techno);
        ApiVO apiVO = this.apiProc.read(techVO.getApi_no());
        MainVO mainVO = this.mainProc.read(apiVO.getMain_no());

        mav.addObject("techVO", techVO);
        mav.addObject("apiVO", apiVO);
        mav.addObject("mainVO", mainVO);
        mav.setViewName("/technology/update_text");

        return mav;
    }
    /**
     * 수정 처리
     * @param techVO
     * @param now_page
     * @return
     */
    @RequestMapping(value="/technology/update_text.do", method = RequestMethod.POST)
    public ModelAndView update_text(TechVO techVO,
            @RequestParam(value="now_page", defaultValue="1")int now_page) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("techno", techVO.getTechno());
        map.put("passwd", techVO.getPasswd());
        
        int cnt = 0;
        int passwd_cnt = this.techProc.passwd_check(map);
        System.out.println("passwd_cnt : " + passwd_cnt);
        if (passwd_cnt == 1) {
            cnt = this.techProc.update_text(techVO);
            mav.addObject("techno", techVO.getTechno());
            mav.addObject("now_page", now_page);
            mav.setViewName("redirect:/technology/read.do");
        } else {
            mav.addObject("code", "passwd_fail");
            mav.setViewName("redirect:/technology/msg.do");
        }
        
        mav.addObject("cnt", cnt);
        mav.addObject("techno", techVO.getTechno());
        
        return mav;
    }
    /**
     * 파일 수정 폼 http://localhost:9091/technology/update_file.do
     * @param techno
     * @return
     */
    @RequestMapping(value="/technology/update_file.do", method=RequestMethod.GET)
    public ModelAndView update_file(int techno) {
        ModelAndView mav = new ModelAndView();
        TechVO techVO = this.techProc.read(techno);
        ApiVO apiVO = this.apiProc.read(techVO.getApi_no());
        MainVO mainVO = this.mainProc.read(apiVO.getMain_no());
        
        mav.addObject("techVO", techVO);
        mav.addObject("apiVO", apiVO);
        mav.addObject("mainVO", mainVO);
        
        mav.setViewName("/technology/update_file");
        
        return mav;
    }
    
    /**
     * 파일수정 처리
     * @param request
     * @param techVO
     * @param now_page
     * @return
     */
    @RequestMapping(value="/technology/update_file.do", method = RequestMethod.POST)
    public ModelAndView update_file(HttpServletRequest request, TechVO techVO, @RequestParam(value="now_page", defaultValue = "1") int now_page) {
        ModelAndView mav = new ModelAndView();
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("techno", techVO.getTechno());
        map.put("passwd", techVO.getPasswd());
        
        int cnt = 0;
        int passwd_cnt = this.techProc.passwd_check(map);
        if (passwd_cnt == 1) {
            mav.addObject("now_page", now_page);
            // -------------------------------------------------------------------
            // 파일 삭제 코드 시작
            // -------------------------------------------------------------------
            // 삭제할 파일 정보를 읽어옴.
            TechVO vo = techProc.read(techVO.getTechno());
            
            String file1saved = vo.getFile1saved();
            String thumb1 = vo.getThumb1();
            long size1 = 0;
            boolean sw = false;
            
            String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로

            sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
            sw = Tool.deleteFile(upDir, thumb1);
            // System.out.println("sw: " + sw);
            // -------------------------------------------------------------------
            // 파일 삭제 종료 시작
            // -------------------------------------------------------------------
            
            // -------------------------------------------------------------------
            // 파일 전송 코드 시작
            // -------------------------------------------------------------------
            String file1 = "";  
            MultipartFile mf = techVO.getFile1MF();
            
            file1 = mf.getOriginalFilename(); // 원본 파일명
            size1 = mf.getSize(); 
            if (size1 > 0) { // 파일 크기 체크
                // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
                file1saved = Upload.saveFileSpring(mf, upDir); 
                
                if (Tool.isImage(file1saved)) { // 이미지인지 검사
                  // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
                  thumb1 = Tool.preview(upDir, file1saved, 250, 200); 
                }
                
              } else {
                  file1 = "";
                  file1saved = "";
                  thumb1 = "";
                  size1 = 0;
                  
              }
            
            techVO.setFile1(file1);
            techVO.setFile1saved(file1saved);
            techVO.setThumb1(thumb1);
            techVO.setSize1(size1);
            // -------------------------------------------------------------------
            // 파일 전송 코드 종료
            // -------------------------------------------------------------------
            
            // Call By Reference: 메모리 공유, Hashcode 전달
            cnt = this.techProc.update_file(techVO);
            mav.setViewName("redirect:/technology/read.do");
        }
        else {
            mav.addObject("cnt", cnt);
            mav.addObject("code","passwd_fail");
            mav.setViewName("redirect:/technology/msg.do");
        }
        
        mav.addObject("techno", techVO.getTechno());
        return mav;
    }
    
    /**
     * 삭제 폼
     * @param techno
     * @return
     */
    @RequestMapping(value="/technology/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int techno) { 
        ModelAndView mav = new  ModelAndView();
        
        TechVO techVO = this.techProc.read(techno);
        ApiVO apiVO = this.apiProc.read(techVO.getApi_no());
        MainVO mainVO = this.mainProc.read(apiVO.getMain_no());
        
        mav.addObject("techVO", techVO);
        mav.addObject("apiVO", apiVO);
        mav.addObject("mainVO", mainVO);
        
        mav.setViewName("/technology/delete");
  
        return mav; 
    }

    @RequestMapping(value="/technology/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(HttpServletRequest request, TechVO techVO, @RequestParam(value="now_page", defaultValue="1")int now_page) {
        ModelAndView mav = new ModelAndView();
        
        int techno = techVO.getTechno();
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("techno", techVO.getTechno());
        map.put("passwd", techVO.getPasswd());
        
        int cnt = 0;
        int passwd_cnt = this.techProc.passwd_check(map);
        
        if (passwd_cnt == 1) { // 패스워드 일치 -> 등록된 파일 삭제 -> 신규 파일 등록
            // -------------------------------------------------------------------
            // 파일 삭제 코드 시작
            // -------------------------------------------------------------------
            // 삭제할 파일 정보를 읽어옴.
            mav.addObject("now_page", now_page);
            TechVO vo = techProc.read(techno);
//            System.out.println("contentsno: " + vo.getContentsno());
//            System.out.println("file1: " + vo.getFile1());
            
            String file1saved = vo.getFile1saved();
            String thumb1 = vo.getThumb1();
            long size1 = 0;
            boolean sw = false;
            
            // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/
            String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/tech_img/storage/"; // 절대 경로

            sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
            sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
            // System.out.println("sw: " + sw);
            // -------------------------------------------------------------------
            // 파일 삭제 종료 시작
            // -------------------------------------------------------------------
            
            cnt = this.techProc.delete(techno); // DBMS 삭제
            mav.addObject("api_no", techVO.getApi_no());
            mav.setViewName("redirect:/technology/list_technology.do"); 

        } else { // 패스워드 오류
            mav.addObject("cnt", cnt);
            mav.addObject("code", "passwd_fail");
            mav.setViewName("redirect:/technology/msg.do");
        }
    
        return mav; // forward
      }       
    /**
     * 목록 + 검색 + 페이징 지원
     * http://localhost:9090/contents/list_by_cateno_search_paging.do?cateno=1&word=스위스&now_page=1
     * 
     * @param cateno
     * @param word
     * @param now_page
     * @return
     */
    @RequestMapping(value = "/technology/list_technology.do", method = RequestMethod.GET)
    public ModelAndView list_technology(@RequestParam(value = "api_no", defaultValue = "1") int api_no,
                                                                           @RequestParam(value = "word", defaultValue = "") String word,
                                                                           @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
      System.out.println("--> now_page: " + now_page);

      ModelAndView mav = new ModelAndView();

      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("api_no", api_no); // #{api_no}
      map.put("word", word); // #{word}
      map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

      // 검색 목록
      List<TechVO> list = techProc.list_technology(map);
      mav.addObject("list", list);

      // 검색된 레코드 갯수
      int search_count = techProc.search_count(map);
      mav.addObject("search_count", search_count);

      ApiVO apiVO = apiProc.read(api_no);
      mav.addObject("apiVO", apiVO);

      MainVO mainVO = mainProc.read(apiVO.getMain_no());
      mav.addObject("mainVO", mainVO);

      /*
       * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
       * 18 19 20 [다음]
       * @param cateno 카테고리번호
       * @param search_count 검색(전체) 레코드수
       * @param now_page 현재 페이지
       * @param word 검색어
       * @return 페이징 생성 문자열
       */
      String paging = techProc.pagingBox(api_no, search_count, now_page, word);
      mav.addObject("paging", paging);

      mav.addObject("now_page", now_page);

      // /contents/list_by_cateno_table_img1_search_paging.jsp
      mav.setViewName("/technology/list_technology");

      return mav;
    }
    
    
    /**
     * Grid 형태의 화면 구성 http://localhost:9091/technology/list_technology_grid.do
     * @param api_no
     * @return
     */
    @RequestMapping(value = "/technology/list_technology_grid.do", method = RequestMethod.GET)
    public ModelAndView list_technology_grid(int api_no) {
        ModelAndView mav = new ModelAndView();
        
        ApiVO apiVO = this.apiProc.read(api_no);
        mav.addObject("apiVO", apiVO);
        
        MainVO mainVO = this.mainProc.read(apiVO.getMain_no());
        mav.addObject("mainVO", mainVO);
        
        List<TechVO> list = this.techProc.list_technology_grid(api_no);
        mav.addObject("list", list);

        mav.setViewName("/technology/list_technology_grid");
        return mav;
    }
    
    
}