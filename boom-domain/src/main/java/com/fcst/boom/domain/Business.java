package com.fcst.boom.domain;

import java.io.Serializable;

import com.fcst.boom.common.page.PageBean;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * TableName:T_BUSINESS
 */

public class Business extends PageBean implements Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = 8891489547767348078L;
	/**
     * 会员手机号码
     */
    private String phone;
    /**
     * 会员身份份证号
     */
    private String idint;
    /**
     * 消费金额
     */
    private Float monetary;
    private String id;
    /**
     * 备注
     */
    private String remark;
    /**
     * 退房时间
     */
    private String endtime;
    /**
     * 开房时间
     */
    private String starttime;
    /**
     * 房间编号
     */
    private String roomcode;
    /**
     * 消费时长(分钟)
     */
    private String duration;

    /**
     * 获取 phone
     * return
     */
    public String getPhone() {
        return this.phone;
    }

    /**
     * 设置 phone
     *
     * @param phone 会员手机号码
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取 idint
     * return
     */
    public String getIdint() {
        return this.idint;
    }

    /**
     * 设置 idint
     *
     * @param idint 会员身份份证号
     */
    public void setIdint(String idint) {
        this.idint = idint;
    }

    /**
     * 获取 monetary
     * return
     */
    public Float getMonetary() {
        return this.monetary;
    }

    /**
     * 设置 monetary
     *
     * @param monetary 消费金额
     */
    public void setMonetary(Float monetary) {
        this.monetary = monetary;
    }

    /**
     * 获取 id
     * return
     */
    public String getId() {
        return this.id;
    }

    /**
     * 设置 id
     *
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取 remark
     * return
     */
    public String getRemark() {
        return this.remark;
    }

    /**
     * 设置 remark
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取 endtime
     * return
     */
    public String getEndtime() {
        return this.endtime;
    }

    /**
     * 设置 endtime
     *
     * @param endtime 退房时间
     */
    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    /**
     * 获取 starttime
     * return
     */
    public String getStarttime() {
        return this.starttime;
    }

    /**
     * 设置 starttime
     *
     * @param starttime 开房时间
     */
    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    /**
     * 获取 roomcode
     * return
     */
    public String getRoomcode() {
        return this.roomcode;
    }

    /**
     * 设置 roomcode
     *
     * @param roomcode 房间编号
     */
    public void setRoomcode(String roomcode) {
        this.roomcode = roomcode;
    }

    /**
     * 获取 duration
     * return
     */
    public String getDuration() {
        return this.duration;
    }

    /**
     * 设置 duration
     *
     * @param duration 消费时长(分钟)
     */
    public void setDuration(String duration) {
        this.duration = duration;
    }
}
