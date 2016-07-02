package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.MemberType;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * 功能:T_MEMBER_TYPE表Mapper接口
 */

public interface MemberTypeDao {

    /**
     * 获取
     *
     * @param memberType
     * @return MemberType
     */
    public MemberType get(MemberType memberType);

    /**
     * 新增
     *
     * @param memberType
     * @return int
     */
    public int insert(MemberType memberType);

    /**
     * 删除
     *
     * @param memberType
     * @return int
     */
    public int delete(MemberType memberType);

    /**
     * 更新
     *
     * @param memberType
     * @return int
     */
    public int update(MemberType memberType);

    /**
     * 查询记录
     *
     * @param memberType
     * @return List<MemberType>
     */
    public List<MemberType> query(MemberType memberType);

    /**
     * 查询记录数
     *
     * @param memberType
     * @return List<MemberType>
     */
    public Integer queryCount(MemberType memberType);
}
