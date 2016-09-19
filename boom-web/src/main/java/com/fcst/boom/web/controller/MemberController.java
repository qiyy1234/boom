package com.fcst.boom.web.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fcst.boom.common.JsonResult;
import com.fcst.boom.domain.Member;
import com.fcst.boom.service.MemberService;

/*@Controller
@RequestMapping("/demo/Member")*/
public class MemberController {
    private static final Log log = LogFactory.getLog(MemberController.class);

    @Autowired
    private MemberService memberService;

    //国际化资�?
    @Resource
    private MessageSource messageSource;

    @RequestMapping("/index")
    public String index() {
        return "/index";
    }

    /**
     * 查询列表�?
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public JsonResult list(HttpServletRequest request, Member member) {
        JsonResult result = new JsonResult();
        try {
            if (member != null
                    && member.getName() != null
                    && !"".equalsIgnoreCase(member.getName())) {
                member.setName(new String(member.getName().getBytes("ISO-8859-1"), "UTF-8"));
            }

            List<Member> data = memberService.query(member);
            // 设置结果�?
            result.put("list", data);
            result.put("rowCount", memberService.queryCount(member));
            result.setSuccess(true);
        } catch (Exception e) {
            log.error("查询异常", e);
            result.setMessage(messageSource.getMessage("demo.common.error.query", new Object[]{}, request.getLocale()));
            result.setSuccess(false);
        }
        return result;
    }

    @RequestMapping("/add")
    public String add() {
        return "/demo/Member/add";
    }


    /**
     * 新增记录
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/post")
    @ResponseBody
    public JsonResult post(HttpServletRequest request, Member member) throws Exception {
        JsonResult result = new JsonResult();
        try {
            //保存
            member.setCreated(new Date());
            memberService.insert(member);
            result.setSuccess(true);
            result.setMessage(messageSource.getMessage("demo.common.addSuccess", new Object[]{}, request.getLocale()));
        } catch (Exception e) {
            log.error("提交数据异常", e);
            result.setMessage(messageSource.getMessage("demo.common.error.submit", new Object[]{}, request.getLocale()));
            result.setSuccess(false);
        }
        return result;
    }

    /**
     * 删除记录
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public JsonResult delete(HttpServletRequest request, Member member) throws Exception {
        JsonResult result = new JsonResult();
        try {
            //删除记录
            memberService.delete(member);
            result.setSuccess(true);
            result.setMessage(messageSource.getMessage("demo.common.deleteSuccess", new Object[]{}, request.getLocale()));
        } catch (Exception e) {
            log.error("删除数据异常", e);
            result.setMessage(messageSource.getMessage("demo.common.error.delete", new Object[]{}, request.getLocale()));
            result.setSuccess(false);
        }
        return result;
    }

    /**
     * 编辑记录
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public ModelAndView  edit(HttpServletRequest request, Member member) throws Exception {
        ModelAndView modelAndView = new ModelAndView(request.getContextPath() + "/demo/Member/edit");
        try {
            //查询记录
            Member memberData =  memberService.get(member);
            modelAndView.addObject("member",memberData);
        } catch (Exception e) {
            log.error("获取数据异常", e);
        }
       return modelAndView;
    }


    /**
     * 更新记录
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/put")
    @ResponseBody
    public JsonResult put(HttpServletRequest request, Member member) throws Exception {
        JsonResult result = new JsonResult();
        try {
            //更新记录
            if(member.getState()==null){
                member.setState("01");
            }else{
                member.setState("00");
            }

            if ( member.getName() != null
                    && !"".equalsIgnoreCase(member.getName())) {
                member.setName(new String(member.getName().getBytes("ISO-8859-1"), "UTF-8"));
            }
            memberService.update(member);
            result.setSuccess(true);
            result.setMessage(messageSource.getMessage("demo.common.updateSuccess", new Object[]{}, request.getLocale()));
        } catch (Exception e) {
            log.error("更新数据异常", e);
            result.setMessage(messageSource.getMessage("demo.common.error.update", new Object[]{}, request.getLocale()));
            result.setSuccess(false);
        }
        return result;
    }

    /**
     * 记录详情
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/get")
    @ResponseBody
    public JsonResult get(HttpServletRequest request, Member member) throws Exception {
        JsonResult result = new JsonResult();
        try {
            //获取记录
            result.setData(memberService.get(member));
            result.setSuccess(true);
        } catch (Exception e) {
            log.error("获取数据异常", e);
            result.setMessage(messageSource.getMessage("demo.common.error.get", new Object[]{}, request.getLocale()));
            result.setSuccess(false);
        }
        return result;
    }
}
