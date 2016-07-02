package com.fcst.boom.domain;

import java.io.Serializable;

import com.fcst.boom.common.page.PageBean;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * TableName:T_MEMBER
 */

public class Member extends PageBean implements Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = -1250386188863241925L;
	/**
     * 会员手机号码
     */
    private String phone;
    /**
     * 会员卡余额
     */
    private Float balance;
    /**
     * 会员状态 00:有效 01：失效
     */
    private String state;
    /**
     * 会员名称
     */
    private String name;
    /**
     * 会员身份份证号
     */
    private String idint;
    /**
     * 会员性别
     */
    private String sex;
    private String id;
    /**
     * 备注
     */
    private String remark;
    /**
     * 会员开房状态 00:开房中  01：未开房  02：预约中
     */
    private String activestate;
    /**
     * 创建时间
     */
    private java.util.Date created;
    /**
     * 会员卡号
     */
    private String cardint;
    /**
     * 会员类型
     */
    private String type;

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
     * 获取 balance
     * return
     */
    public Float getBalance() {
        return this.balance;
    }

    /**
     * 设置 balance
     *
     * @param balance 会员卡余额
     */
    public void setBalance(Float balance) {
        this.balance = balance;
    }

    /**
     * 获取 state
     * return
     */
    public String getState() {
        return this.state;
    }

    /**
     * 设置 state
     *
     * @param state 会员状态 00:有效 01：失效
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * 获取 name
     * return
     */
    public String getName() {
        return this.name;
    }

    /**
     * 设置 name
     *
     * @param name 会员名称
     */
    public void setName(String name) {
        this.name = name;
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
     * 获取 sex
     * return
     */
    public String getSex() {
        return this.sex;
    }

    /**
     * 设置 sex
     *
     * @param sex 会员性别
     */
    public void setSex(String sex) {
        this.sex = sex;
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
     * 获取 activestate
     * return
     */
    public String getActivestate() {
        return this.activestate;
    }

    /**
     * 设置 activestate
     *
     * @param activestate 会员开房状态 00:开房中  01：未开房  02：预约中
     */
    public void setActivestate(String activestate) {
        this.activestate = activestate;
    }

    /**
     * 获取 created
     * return
     */
    public java.util.Date getCreated() {
        return this.created;
    }

    /**
     * 设置 created
     *
     * @param created 创建时间
     */
    public void setCreated(java.util.Date created) {
        this.created = created;
    }

    /**
     * 获取 cardint
     * return
     */
    public String getCardint() {
        return this.cardint;
    }

    /**
     * 设置 cardint
     *
     * @param cardint 会员卡号
     */
    public void setCardint(String cardint) {
        this.cardint = cardint;
    }

    /**
     * 获取 type
     * return
     */
    public String getType() {
        return this.type;
    }

    /**
     * 设置 type
     *
     * @param type 会员类型
     */
    public void setType(String type) {
        this.type = type;
    }
}
