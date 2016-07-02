package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.Member;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * 功能:T_MEMBER表Mapper接口
 */

public interface MemberDao {

    /**
     * 获取
     *
     * @param member
     * @return Member
     */
    public Member get(Member member);

    /**
     * 新增
     *
     * @param member
     * @return int
     */
    public int insert(Member member);

    /**
     * 删除
     *
     * @param member
     * @return int
     */
    public int delete(Member member);

    /**
     * 更新
     *
     * @param member
     * @return int
     */
    public int update(Member member);

    /**
     * 查询记录
     *
     * @param member
     * @return List<Member>
     */
    public List<Member> query(Member member);

    /**
     * 查询记录数
     *
     * @param member
     * @return List<Member>
     */
    public Integer queryCount(Member member);
}
