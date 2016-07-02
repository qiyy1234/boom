package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.MemberType;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:12
 * 功能:T_MEMBER_TYPE表Service接口
 */

public interface MemberTypeService {

    /**
     * 获取
     *
     * @param memberType
     * @return int
     */
    public MemberType get(MemberType memberType) throws Exception;

    /**
     * 新增
     *
     * @param memberType
     * @return int
     */
    public int insert(MemberType memberType) throws Exception;

    /**
     * 删除
     *
     * @param memberType
     * @return int
     */
    public int delete(MemberType memberType) throws Exception;

    /**
     * 更新
     *
     * @param memberType
     * @return int
     */
    public int update(MemberType memberType) throws Exception;

    /**
     * 查询
     *
     * @param memberType
     * @return List<MemberType>
     */
    public List<MemberType> query(MemberType memberType) throws Exception;

    /**
     * 查询记录数
     *
     * @param memberType
     * @return List<MemberType>
     */
    public Integer queryCount(MemberType memberType) throws Exception;
}
