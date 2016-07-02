package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.Business;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * 功能:T_BUSINESS表Mapper接口
 */

public interface BusinessDao {

    /**
     * 获取
     *
     * @param business
     * @return Business
     */
    public Business get(Business business);

    /**
     * 新增
     *
     * @param business
     * @return int
     */
    public int insert(Business business);

    /**
     * 删除
     *
     * @param business
     * @return int
     */
    public int delete(Business business);

    /**
     * 更新
     *
     * @param business
     * @return int
     */
    public int update(Business business);

    /**
     * 查询记录
     *
     * @param business
     * @return List<Business>
     */
    public List<Business> query(Business business);

    /**
     * 查询记录数
     *
     * @param business
     * @return List<Business>
     */
    public Integer queryCount(Business business);
}
