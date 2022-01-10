package dev.mvc.main;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeCont {
    

  // http://localhost:9091
    @RequestMapping(value = {"/", "/center.do"}, method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        
        return "center";  // /resort/index.jsp
  }
}