package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.Member;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:12
 * 功能:T_MEMBER表Service接口
 */

public interface MemberService {

    /**
     * 获取
     *
     * @param member
     * @return int
     */
    public Member get(Member member) throws Exception;

    /**
     * 新增
     *
     * @param member
     * @return int
     */
    public int insert(Member member) throws Exception;

    /**
     * 删除
     *
     * @param member
     * @return int
     */
    public int delete(Member member) throws Exception;

    /**
     * 更新
     *
     * @param member
     * @return int
     */
    public int update(Member member) throws Exception;

    /**
     * 查询
     *
     * @param member
     * @return List<Member>
     */
    public List<Member> query(Member member) throws Exception;

    /**
     * 查询记录数
     *
     * @param member
     * @return List<Member>
     */
    public Integer queryCount(Member member) throws Exception;
}
