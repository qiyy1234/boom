package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.RoomType;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * 功能:T_ROOM_TYPE表Mapper接口
 */

public interface RoomTypeDao {

    /**
     * 获取
     *
     * @param roomType
     * @return RoomType
     */
    public RoomType get(RoomType roomType);

    /**
     * 新增
     *
     * @param roomType
     * @return int
     */
    public int insert(RoomType roomType);

    /**
     * 删除
     *
     * @param roomType
     * @return int
     */
    public int delete(RoomType roomType);

    /**
     * 更新
     *
     * @param roomType
     * @return int
     */
    public int update(RoomType roomType);

    /**
     * 查询记录
     *
     * @param roomType
     * @return List<RoomType>
     */
    public List<RoomType> query(RoomType roomType);

    /**
     * 查询记录数
     *
     * @param roomType
     * @return List<RoomType>
     */
    public Integer queryCount(RoomType roomType);
}
