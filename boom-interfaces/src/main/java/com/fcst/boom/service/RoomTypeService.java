package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.RoomType;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:12
 * 功能:T_ROOM_TYPE表Service接口
 */

public interface RoomTypeService {

    /**
     * 获取
     *
     * @param roomType
     * @return int
     */
    public RoomType get(RoomType roomType) throws Exception;

    /**
     * 新增
     *
     * @param roomType
     * @return int
     */
    public int insert(RoomType roomType) throws Exception;

    /**
     * 删除
     *
     * @param roomType
     * @return int
     */
    public int delete(RoomType roomType) throws Exception;

    /**
     * 更新
     *
     * @param roomType
     * @return int
     */
    public int update(RoomType roomType) throws Exception;

    /**
     * 查询
     *
     * @param roomType
     * @return List<RoomType>
     */
    public List<RoomType> query(RoomType roomType) throws Exception;

    /**
     * 查询记录数
     *
     * @param roomType
     * @return List<RoomType>
     */
    public Integer queryCount(RoomType roomType) throws Exception;
}
