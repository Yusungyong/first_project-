package dev.mvc.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.api.ApiProc")
public class ApiProc implements ApiProcInter {
    
    @Autowired
    private ApiDAOInter apiDAO;

    @Override
    public int create(ApiVO apiVO) {
        int cnt = this.apiDAO.create(apiVO);
        return cnt;
    }

    @Override
    public List<ApiVO> list_api(int main_no) {
        List<ApiVO> list = this.apiDAO.list_api(main_no);
        return list;
    }

    @Override
    public int delete(int api_no) {
        int cnt = this.apiDAO.delete(api_no);
        return cnt;
    }

    @Override
    public ApiVO read(int api_no) {
        ApiVO apiVO = this.apiDAO.read(api_no);
        return apiVO;
    }

    @Override
    public int update(ApiVO apiVO) {
        int cnt = this.apiDAO.update(apiVO);
        return cnt;
    }
}
