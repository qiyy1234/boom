package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.Business;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:12
 * 功能:T_BUSINESS表Service接口
 */

public interface BusinessService {

    /**
     * 获取
     *
     * @param business
     * @return int
     */
    public Business get(Business business) throws Exception;

    /**
     * 新增
     *
     * @param business
     * @return int
     */
    public int insert(Business business) throws Exception;

    /**
     * 删除
     *
     * @param business
     * @return int
     */
    public int delete(Business business) throws Exception;

    /**
     * 更新
     *
     * @param business
     * @return int
     */
    public int update(Business business) throws Exception;

    /**
     * 查询
     *
     * @param business
     * @return List<Business>
     */
    public List<Business> query(Business business) throws Exception;

    /**
     * 查询记录数
     *
     * @param business
     * @return List<Business>
     */
    public Integer queryCount(Business business) throws Exception;
}
