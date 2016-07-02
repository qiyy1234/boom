package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.Room;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * 功能:T_ROOM表Mapper接口
 */

public interface RoomDao {

    /**
     * 获取
     *
     * @param room
     * @return Room
     */
    public Room get(Room room);

    /**
     * 新增
     *
     * @param room
     * @return int
     */
    public int insert(Room room);

    /**
     * 删除
     *
     * @param room
     * @return int
     */
    public int delete(Room room);

    /**
     * 更新
     *
     * @param room
     * @return int
     */
    public int update(Room room);

    /**
     * 查询记录
     *
     * @param room
     * @return List<Room>
     */
    public List<Room> query(Room room);

    /**
     * 查询记录数
     *
     * @param room
     * @return List<Room>
     */
    public Integer queryCount(Room room);
}
